module XRTShim (
    // main clock
    input          ap_clk,
    input          ap_rst_n,

    // TODO: Re-add
    //// firesim clock
    //input          ap_clk_2,
    //input          ap_rst_n_2,

    output         s_axi_lite_awready,
    input          s_axi_lite_awvalid,
    input  [24:0]  s_axi_lite_awaddr,
    input  [7:0]   s_axi_lite_awlen,
    input  [2:0]   s_axi_lite_awsize,
    input  [1:0]   s_axi_lite_awburst,
    input          s_axi_lite_awlock,
    input  [3:0]   s_axi_lite_awcache,
    input  [2:0]   s_axi_lite_awprot,
    input  [3:0]   s_axi_lite_awqos,
    input  [3:0]   s_axi_lite_awregion,
    input  [11:0]  s_axi_lite_awid,
    input          s_axi_lite_awuser,
    output         s_axi_lite_wready,
    input          s_axi_lite_wvalid,
    input  [31:0]  s_axi_lite_wdata,
    input          s_axi_lite_wlast,
    input  [11:0]  s_axi_lite_wid,
    input  [3:0]   s_axi_lite_wstrb,
    input          s_axi_lite_wuser,
    input          s_axi_lite_bready,
    output         s_axi_lite_bvalid,
    output [1:0]   s_axi_lite_bresp,
    output [11:0]  s_axi_lite_bid,
    output         s_axi_lite_buser,
    output         s_axi_lite_arready,
    input          s_axi_lite_arvalid,
    input  [24:0]  s_axi_lite_araddr,
    input  [7:0]   s_axi_lite_arlen,
    input  [2:0]   s_axi_lite_arsize,
    input  [1:0]   s_axi_lite_arburst,
    input          s_axi_lite_arlock,
    input  [3:0]   s_axi_lite_arcache,
    input  [2:0]   s_axi_lite_arprot,
    input  [3:0]   s_axi_lite_arqos,
    input  [3:0]   s_axi_lite_arregion,
    input  [11:0]  s_axi_lite_arid,
    input          s_axi_lite_aruser,
    input          s_axi_lite_rready,
    output         s_axi_lite_rvalid,
    output [1:0]   s_axi_lite_rresp,
    output [31:0]  s_axi_lite_rdata,
    output         s_axi_lite_rlast,
    output [11:0]  s_axi_lite_rid,
    output         s_axi_lite_ruser
);

    // TODO: Re-add
    ////-------------------------------------------------
    //// Clock Domain Crossings
    ////-------------------------------------------------

    //wire         s_axi_lite_awready_sync;
    //wire         s_axi_lite_awvalid_sync;
    //wire [24:0]  s_axi_lite_awaddr_sync;
    //wire [7:0]   s_axi_lite_awlen_sync;
    //wire [2:0]   s_axi_lite_awsize_sync;
    //wire [1:0]   s_axi_lite_awburst_sync;
    //wire         s_axi_lite_awlock_sync;
    //wire [3:0]   s_axi_lite_awcache_sync;
    //wire [2:0]   s_axi_lite_awprot_sync;
    //wire [3:0]   s_axi_lite_awqos_sync;
    //wire [3:0]   s_axi_lite_awregion_sync;
    //wire [11:0]  s_axi_lite_awid_sync;
    //wire         s_axi_lite_awuser_sync;
    //wire         s_axi_lite_wready_sync;
    //wire         s_axi_lite_wvalid_sync;
    //wire [31:0]  s_axi_lite_wdata_sync;
    //wire         s_axi_lite_wlast_sync;
    //wire [11:0]  s_axi_lite_wid_sync;
    //wire [3:0]   s_axi_lite_wstrb_sync;
    //wire         s_axi_lite_wuser_sync;
    //wire         s_axi_lite_bready_sync;
    //wire         s_axi_lite_bvalid_sync;
    //wire [1:0]   s_axi_lite_bresp_sync;
    //wire [11:0]  s_axi_lite_bid_sync;
    //wire         s_axi_lite_buser_sync;
    //wire         s_axi_lite_arready_sync;
    //wire         s_axi_lite_arvalid_sync;
    //wire [24:0]  s_axi_lite_araddr_sync;
    //wire [7:0]   s_axi_lite_arlen_sync;
    //wire [2:0]   s_axi_lite_arsize_sync;
    //wire [1:0]   s_axi_lite_arburst_sync;
    //wire         s_axi_lite_arlock_sync;
    //wire [3:0]   s_axi_lite_arcache_sync;
    //wire [2:0]   s_axi_lite_arprot_sync;
    //wire [3:0]   s_axi_lite_arqos_sync;
    //wire [3:0]   s_axi_lite_arregion_sync;
    //wire [11:0]  s_axi_lite_arid_sync;
    //wire         s_axi_lite_aruser_sync;
    //wire         s_axi_lite_rready_sync;
    //wire         s_axi_lite_rvalid_sync;
    //wire [1:0]   s_axi_lite_rresp_sync;
    //wire [31:0]  s_axi_lite_rdata_sync;
    //wire         s_axi_lite_rlast_sync;
    //wire [11:0]  s_axi_lite_rid_sync;
    //wire         s_axi_lite_ruser_sync;

    //axi_clock_converter_s_axi_lite s_axi_lite_clock_convert (
    //    .s_axi_aclk(ap_clk),
    //    .s_axi_aresetn(ap_rst_n),
    //    .s_axi_awaddr(s_axi_lite_awaddr),
    //    .s_axi_awprot(s_axi_lite_awprot),
    //    .s_axi_awvalid(s_axi_lite_awvalid),
    //    .s_axi_awready(s_axi_lite_awready),
    //    .s_axi_wdata(s_axi_lite_wdata),
    //    .s_axi_wstrb(s_axi_lite_wstrb),
    //    .s_axi_wvalid(s_axi_lite_wvalid),
    //    .s_axi_wready(s_axi_lite_wready),
    //    .s_axi_bresp(s_axi_lite_bresp),
    //    .s_axi_bvalid(s_axi_lite_bvalid),
    //    .s_axi_bready(s_axi_lite_bready),
    //    .s_axi_araddr(s_axi_lite_araddr),
    //    .s_axi_arprot(s_axi_lite_arprot),
    //    .s_axi_arvalid(s_axi_lite_arvalid),
    //    .s_axi_arready(s_axi_lite_arready),
    //    .s_axi_rdata(s_axi_lite_rdata),
    //    .s_axi_rresp(s_axi_lite_rresp),
    //    .s_axi_rvalid(s_axi_lite_rvalid),
    //    .s_axi_rready(s_axi_lite_rready),

    //    .m_axi_aclk(ap_clk_2),
    //    .m_axi_aresetn(ap_rst_n_2),
    //    .m_axi_awaddr(s_axi_lite_awaddr_sync),
    //    .m_axi_awprot(s_axi_lite_awprot_sync),
    //    .m_axi_awvalid(s_axi_lite_awvalid_sync),
    //    .m_axi_awready(s_axi_lite_awready_sync),
    //    .m_axi_wdata(s_axi_lite_wdata_sync),
    //    .m_axi_wstrb(s_axi_lite_wstrb_sync),
    //    .m_axi_wvalid(s_axi_lite_wvalid_sync),
    //    .m_axi_wready(s_axi_lite_wready_sync),
    //    .m_axi_bresp(s_axi_lite_bresp_sync),
    //    .m_axi_bvalid(s_axi_lite_bvalid_sync),
    //    .m_axi_bready(s_axi_lite_bready_sync),
    //    .m_axi_araddr(s_axi_lite_araddr_sync),
    //    .m_axi_arprot(s_axi_lite_arprot_sync),
    //    .m_axi_arvalid(s_axi_lite_arvalid_sync),
    //    .m_axi_arready(s_axi_lite_arready_sync),
    //    .m_axi_rdata(s_axi_lite_rdata_sync),
    //    .m_axi_rresp(s_axi_lite_rresp_sync),
    //    .m_axi_rvalid(s_axi_lite_rvalid_sync),
    //    .m_axi_rready(s_axi_lite_rready_sync)
    //);

    // ------------------------------------------------

    //F1Shim f1Shim (
    //    .clock(ap_clk_2),
    //    .reset(!ap_rst_n_2),
    //    .io_master_aw_ready(s_axi_lite_awready_sync),
    //    .io_master_aw_valid(s_axi_lite_awvalid_sync),
    //    .io_master_aw_bits_addr(s_axi_lite_awaddr_sync),
    //    .io_master_aw_bits_len(s_axi_lite_awlen_sync),
    //    .io_master_aw_bits_size(s_axi_lite_awsize_sync),
    //    .io_master_aw_bits_burst(s_axi_lite_awburst_sync),
    //    .io_master_aw_bits_lock(s_axi_lite_awlock_sync),
    //    .io_master_aw_bits_cache(s_axi_lite_awcache_sync),
    //    .io_master_aw_bits_prot(s_axi_lite_awprot_sync),
    //    .io_master_aw_bits_qos(s_axi_lite_awqos_sync),
    //    .io_master_aw_bits_region(s_axi_lite_awregion_sync),
    //    .io_master_aw_bits_id(s_axi_lite_awid_sync),
    //    .io_master_aw_bits_user(s_axi_lite_awuser_sync),
    //    .io_master_w_ready(s_axi_lite_wready_sync),
    //    .io_master_w_valid(s_axi_lite_wvalid_sync),
    //    .io_master_w_bits_data(s_axi_lite_wdata_sync),
    //    .io_master_w_bits_last(s_axi_lite_wlast_sync),
    //    .io_master_w_bits_id(s_axi_lite_wid_sync),
    //    .io_master_w_bits_strb(s_axi_lite_wstrb_sync),
    //    .io_master_w_bits_user(s_axi_lite_wuser_sync),
    //    .io_master_b_ready(s_axi_lite_bready_sync),
    //    .io_master_b_valid(s_axi_lite_bvalid_sync),
    //    .io_master_b_bits_resp(s_axi_lite_bresp_sync),
    //    .io_master_b_bits_id(s_axi_lite_bid_sync),
    //    .io_master_b_bits_user(s_axi_lite_buser_sync),
    //    .io_master_ar_ready(s_axi_lite_arready_sync),
    //    .io_master_ar_valid(s_axi_lite_arvalid_sync),
    //    .io_master_ar_bits_addr(s_axi_lite_araddr_sync),
    //    .io_master_ar_bits_len(s_axi_lite_arlen_sync),
    //    .io_master_ar_bits_size(s_axi_lite_arsize_sync),
    //    .io_master_ar_bits_burst(s_axi_lite_arburst_sync),
    //    .io_master_ar_bits_lock(s_axi_lite_arlock_sync),
    //    .io_master_ar_bits_cache(s_axi_lite_arcache_sync),
    //    .io_master_ar_bits_prot(s_axi_lite_arprot_sync),
    //    .io_master_ar_bits_qos(s_axi_lite_arqos_sync),
    //    .io_master_ar_bits_region(s_axi_lite_arregion_sync),
    //    .io_master_ar_bits_id(s_axi_lite_arid_sync),
    //    .io_master_ar_bits_user(s_axi_lite_aruser_sync),
    //    .io_master_r_ready(s_axi_lite_rready_sync),
    //    .io_master_r_valid(s_axi_lite_rvalid_sync),
    //    .io_master_r_bits_resp(s_axi_lite_rresp_sync),
    //    .io_master_r_bits_data(s_axi_lite_rdata_sync),
    //    .io_master_r_bits_last(s_axi_lite_rlast_sync),
    //    .io_master_r_bits_id(s_axi_lite_rid_sync),
    //    .io_master_r_bits_user(s_axi_lite_ruser_sync)
    //);

    VitisShim vitisShim (
        .clock(ap_clk),
        .reset(ap_rst_n),
        .io_master_aw_ready(s_axi_lite_awready),
        .io_master_aw_valid(s_axi_lite_awvalid),
        .io_master_aw_bits_addr(s_axi_lite_awaddr),
        .io_master_aw_bits_len(s_axi_lite_awlen),
        .io_master_aw_bits_size(s_axi_lite_awsize),
        .io_master_aw_bits_burst(s_axi_lite_awburst),
        .io_master_aw_bits_lock(s_axi_lite_awlock),
        .io_master_aw_bits_cache(s_axi_lite_awcache),
        .io_master_aw_bits_prot(s_axi_lite_awprot),
        .io_master_aw_bits_qos(s_axi_lite_awqos),
        .io_master_aw_bits_region(s_axi_lite_awregion),
        .io_master_aw_bits_id(s_axi_lite_awid),
        .io_master_aw_bits_user(s_axi_lite_awuser),
        .io_master_w_ready(s_axi_lite_wready),
        .io_master_w_valid(s_axi_lite_wvalid),
        .io_master_w_bits_data(s_axi_lite_wdata),
        .io_master_w_bits_last(s_axi_lite_wlast),
        .io_master_w_bits_id(s_axi_lite_wid),
        .io_master_w_bits_strb(s_axi_lite_wstrb),
        .io_master_w_bits_user(s_axi_lite_wuser),
        .io_master_b_ready(s_axi_lite_bready),
        .io_master_b_valid(s_axi_lite_bvalid),
        .io_master_b_bits_resp(s_axi_lite_bresp),
        .io_master_b_bits_id(s_axi_lite_bid),
        .io_master_b_bits_user(s_axi_lite_buser),
        .io_master_ar_ready(s_axi_lite_arready),
        .io_master_ar_valid(s_axi_lite_arvalid),
        .io_master_ar_bits_addr(s_axi_lite_araddr),
        .io_master_ar_bits_len(s_axi_lite_arlen),
        .io_master_ar_bits_size(s_axi_lite_arsize),
        .io_master_ar_bits_burst(s_axi_lite_arburst),
        .io_master_ar_bits_lock(s_axi_lite_arlock),
        .io_master_ar_bits_cache(s_axi_lite_arcache),
        .io_master_ar_bits_prot(s_axi_lite_arprot),
        .io_master_ar_bits_qos(s_axi_lite_arqos),
        .io_master_ar_bits_region(s_axi_lite_arregion),
        .io_master_ar_bits_id(s_axi_lite_arid),
        .io_master_ar_bits_user(s_axi_lite_aruser),
        .io_master_r_ready(s_axi_lite_rready),
        .io_master_r_valid(s_axi_lite_rvalid),
        .io_master_r_bits_resp(s_axi_lite_rresp),
        .io_master_r_bits_data(s_axi_lite_rdata),
        .io_master_r_bits_last(s_axi_lite_rlast),
        .io_master_r_bits_id(s_axi_lite_rid),
        .io_master_r_bits_user(s_axi_lite_ruser)
    );

endmodule

