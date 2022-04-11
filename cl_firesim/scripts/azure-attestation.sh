#! /usr/bin/env bash
set -x

input_file=$1
output_file=$2

if [[ $# != 2 ]]; then
    echo "$0 expects two arguments. The input xclbin to run the attestation process on and a path to the desired output file.\n"
    exit 1;
fi

acct_name=firesim
container=firesim-biancolin

# I've justed hashed the input here so that xclbins don't conflict in a flat namespace.
# I'm not actually sure if identical inputs to Vitis will produce a
# bit-identical output -- i'd assume not.
dcp_sha=$(sha1sum $input_file | awk '{ print $1 }')
container_input_file="${dcp_sha}.xclbin"

# Note, there will be a "bit.xclbin" generated that can be used with a local U250.
container_output_file="${dcp_sha}.azure.xclbin"

# I picked this delta arbitrarily. For Rocket-based designs the process
# finishes in < 30m
end=$(date -u -d "6 hours" '+%Y-%m-%dT%H:%MZ')
SAS=$(az storage container generate-sas \
    --account-name $acct_name \
    --name $container \
    --expiry $end \
    --https-only --permissions rwc --output tsv)

# This presupposes the existence of the container.
az storage blob upload \
    --account-name $acct_name \
    --container-name $container \
    --name $container_input_file \
    --file $input_file

mkdir -p attestation
cd attestation/
wget https://fpgaattestation.blob.core.windows.net/validationscripts/validate.zip
unzip -o validate.zip

bash scripts/validate-fpgaimage.sh \
    --storage-account $acct_name \
    --container $container \
    --netlist-name $container_input_file \
    --blob-container-sas "$SAS"

# Note there are also log files that are of the form:
# ${dcp_sha}-vivado*.txt and ${dcp_sha}-log* that can be pulled down.
# There are three phases, each of which can fail, you'll have to look at the
# right sublog to figure out why.
cd ..
az storage blob download \
    --account-name ${acct_name} \
    --container-name ${container} \
    --name ${container_output_file} \
    --file ${output_file}
