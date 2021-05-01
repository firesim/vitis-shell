module XRTShim (
    // main clock
    input          ap_clk,
    input          ap_rst_n,

    // firesim clock
    input          ap_clk_2,
    input          ap_rst_n_2,

    output         s_axi_control_awready,
    input          s_axi_control_awvalid,
    input  [24:0]  s_axi_control_awaddr,
    input  [7:0]   s_axi_control_awlen,
    input  [2:0]   s_axi_control_awsize,
    input  [1:0]   s_axi_control_awburst,
    input          s_axi_control_awlock,
    input  [3:0]   s_axi_control_awcache,
    input  [2:0]   s_axi_control_awprot,
    input  [3:0]   s_axi_control_awqos,
    input  [3:0]   s_axi_control_awregion,
    input  [11:0]  s_axi_control_awid,
    input          s_axi_control_awuser,
    output         s_axi_control_wready,
    input          s_axi_control_wvalid,
    input  [31:0]  s_axi_control_wdata,
    input          s_axi_control_wlast,
    input  [11:0]  s_axi_control_wid,
    input  [3:0]   s_axi_control_wstrb,
    input          s_axi_control_wuser,
    input          s_axi_control_bready,
    output         s_axi_control_bvalid,
    output [1:0]   s_axi_control_bresp,
    output [11:0]  s_axi_control_bid,
    output         s_axi_control_buser,
    output         s_axi_control_arready,
    input          s_axi_control_arvalid,
    input  [24:0]  s_axi_control_araddr,
    input  [7:0]   s_axi_control_arlen,
    input  [2:0]   s_axi_control_arsize,
    input  [1:0]   s_axi_control_arburst,
    input          s_axi_control_arlock,
    input  [3:0]   s_axi_control_arcache,
    input  [2:0]   s_axi_control_arprot,
    input  [3:0]   s_axi_control_arqos,
    input  [3:0]   s_axi_control_arregion,
    input  [11:0]  s_axi_control_arid,
    input          s_axi_control_aruser,
    input          s_axi_control_rready,
    output         s_axi_control_rvalid,
    output [1:0]   s_axi_control_rresp,
    output [31:0]  s_axi_control_rdata,
    output         s_axi_control_rlast,
    output [11:0]  s_axi_control_rid,
    output         s_axi_control_ruser,

    output         pcie_dma_awready,
    input          pcie_dma_awvalid,
    input  [63:0]  pcie_dma_awaddr,
    input  [7:0]   pcie_dma_awlen,
    input  [2:0]   pcie_dma_awsize,
    input  [1:0]   pcie_dma_awburst,
    input          pcie_dma_awlock,
    input  [3:0]   pcie_dma_awcache,
    input  [2:0]   pcie_dma_awprot,
    input  [3:0]   pcie_dma_awqos,
    input  [3:0]   pcie_dma_awregion,
    input  [5:0]   pcie_dma_awid,
    input          pcie_dma_awuser,
    output         pcie_dma_wready,
    input          pcie_dma_wvalid,
    input  [511:0] pcie_dma_wdata,
    input          pcie_dma_wlast,
    input  [5:0]   pcie_dma_wid,
    input  [63:0]  pcie_dma_wstrb,
    input          pcie_dma_wuser,
    input          pcie_dma_bready,
    output         pcie_dma_bvalid,
    output [1:0]   pcie_dma_bresp,
    output [5:0]   pcie_dma_bid,
    output         pcie_dma_buser,
    output         pcie_dma_arready,
    input          pcie_dma_arvalid,
    input  [63:0]  pcie_dma_araddr,
    input  [7:0]   pcie_dma_arlen,
    input  [2:0]   pcie_dma_arsize,
    input  [1:0]   pcie_dma_arburst,
    input          pcie_dma_arlock,
    input  [3:0]   pcie_dma_arcache,
    input  [2:0]   pcie_dma_arprot,
    input  [3:0]   pcie_dma_arqos,
    input  [3:0]   pcie_dma_arregion,
    input  [5:0]   pcie_dma_arid,
    input          pcie_dma_aruser,
    input          pcie_dma_rready,
    output         pcie_dma_rvalid,
    output [1:0]   pcie_dma_rresp,
    output [511:0] pcie_dma_rdata,
    output         pcie_dma_rlast,
    output [5:0]   pcie_dma_rid,
    output         pcie_dma_ruser,

    input          ddr_3_awready,
    output         ddr_3_awvalid,
    output [15:0]  ddr_3_awid,
    output [63:0]  ddr_3_awaddr,
    output [7:0]   ddr_3_awlen,
    output [2:0]   ddr_3_awsize,
    output [1:0]   ddr_3_awburst,
    output         ddr_3_awlock,
    output [3:0]   ddr_3_awcache,
    output [2:0]   ddr_3_awprot,
    output [3:0]   ddr_3_awqos,
    input          ddr_3_wready,
    output         ddr_3_wvalid,
    output [63:0]  ddr_3_wdata,
    output [7:0]   ddr_3_wstrb,
    output         ddr_3_wlast,
    output         ddr_3_bready,
    input          ddr_3_bvalid,
    input  [15:0]  ddr_3_bid,
    input  [1:0]   ddr_3_bresp,
    input          ddr_3_arready,
    output         ddr_3_arvalid,
    output [15:0]  ddr_3_arid,
    output [63:0]  ddr_3_araddr,
    output [7:0]   ddr_3_arlen,
    output [2:0]   ddr_3_arsize,
    output [1:0]   ddr_3_arburst,
    output         ddr_3_arlock,
    output [3:0]   ddr_3_arcache,
    output [2:0]   ddr_3_arprot,
    output [3:0]   ddr_3_arqos,
    output         ddr_3_rready,
    input          ddr_3_rvalid,
    input  [15:0]  ddr_3_rid,
    input  [63:0]  ddr_3_rdata,
    input  [1:0]   ddr_3_rresp,
    input          ddr_3_rlast,

    input          ddr_2_awready,
    output         ddr_2_awvalid,
    output [15:0]  ddr_2_awid,
    output [63:0]  ddr_2_awaddr,
    output [7:0]   ddr_2_awlen,
    output [2:0]   ddr_2_awsize,
    output [1:0]   ddr_2_awburst,
    output         ddr_2_awlock,
    output [3:0]   ddr_2_awcache,
    output [2:0]   ddr_2_awprot,
    output [3:0]   ddr_2_awqos,
    input          ddr_2_wready,
    output         ddr_2_wvalid,
    output [63:0]  ddr_2_wdata,
    output [7:0]   ddr_2_wstrb,
    output         ddr_2_wlast,
    output         ddr_2_bready,
    input          ddr_2_bvalid,
    input  [15:0]  ddr_2_bid,
    input  [1:0]   ddr_2_bresp,
    input          ddr_2_arready,
    output         ddr_2_arvalid,
    output [15:0]  ddr_2_arid,
    output [63:0]  ddr_2_araddr,
    output [7:0]   ddr_2_arlen,
    output [2:0]   ddr_2_arsize,
    output [1:0]   ddr_2_arburst,
    output         ddr_2_arlock,
    output [3:0]   ddr_2_arcache,
    output [2:0]   ddr_2_arprot,
    output [3:0]   ddr_2_arqos,
    output         ddr_2_rready,
    input          ddr_2_rvalid,
    input  [15:0]  ddr_2_rid,
    input  [63:0]  ddr_2_rdata,
    input  [1:0]   ddr_2_rresp,
    input          ddr_2_rlast,

    input          ddr_1_awready,
    output         ddr_1_awvalid,
    output [15:0]  ddr_1_awid,
    output [63:0]  ddr_1_awaddr,
    output [7:0]   ddr_1_awlen,
    output [2:0]   ddr_1_awsize,
    output [1:0]   ddr_1_awburst,
    output         ddr_1_awlock,
    output [3:0]   ddr_1_awcache,
    output [2:0]   ddr_1_awprot,
    output [3:0]   ddr_1_awqos,
    input          ddr_1_wready,
    output         ddr_1_wvalid,
    output [63:0]  ddr_1_wdata,
    output [7:0]   ddr_1_wstrb,
    output         ddr_1_wlast,
    output         ddr_1_bready,
    input          ddr_1_bvalid,
    input  [15:0]  ddr_1_bid,
    input  [1:0]   ddr_1_bresp,
    input          ddr_1_arready,
    output         ddr_1_arvalid,
    output [15:0]  ddr_1_arid,
    output [63:0]  ddr_1_araddr,
    output [7:0]   ddr_1_arlen,
    output [2:0]   ddr_1_arsize,
    output [1:0]   ddr_1_arburst,
    output         ddr_1_arlock,
    output [3:0]   ddr_1_arcache,
    output [2:0]   ddr_1_arprot,
    output [3:0]   ddr_1_arqos,
    output         ddr_1_rready,
    input          ddr_1_rvalid,
    input  [15:0]  ddr_1_rid,
    input  [63:0]  ddr_1_rdata,
    input  [1:0]   ddr_1_rresp,
    input          ddr_1_rlast,

    input          ddr_0_awready,
    output         ddr_0_awvalid,
    output [15:0]  ddr_0_awid,
    output [63:0]  ddr_0_awaddr,
    output [7:0]   ddr_0_awlen,
    output [2:0]   ddr_0_awsize,
    output [1:0]   ddr_0_awburst,
    output         ddr_0_awlock,
    output [3:0]   ddr_0_awcache,
    output [2:0]   ddr_0_awprot,
    output [3:0]   ddr_0_awqos,
    input          ddr_0_wready,
    output         ddr_0_wvalid,
    output [63:0]  ddr_0_wdata,
    output [7:0]   ddr_0_wstrb,
    output         ddr_0_wlast,
    output         ddr_0_bready,
    input          ddr_0_bvalid,
    input  [15:0]  ddr_0_bid,
    input  [1:0]   ddr_0_bresp,
    input          ddr_0_arready,
    output         ddr_0_arvalid,
    output [15:0]  ddr_0_arid,
    output [63:0]  ddr_0_araddr,
    output [7:0]   ddr_0_arlen,
    output [2:0]   ddr_0_arsize,
    output [1:0]   ddr_0_arburst,
    output         ddr_0_arlock,
    output [3:0]   ddr_0_arcache,
    output [2:0]   ddr_0_arprot,
    output [3:0]   ddr_0_arqos,
    output         ddr_0_rready,
    input          ddr_0_rvalid,
    input  [15:0]  ddr_0_rid,
    input  [63:0]  ddr_0_rdata,
    input  [1:0]   ddr_0_rresp,
    input          ddr_0_rlast
);

    //-------------------------------------------------
    // Clock Domain Crossings
    //-------------------------------------------------

    wire         s_axi_control_awready_sync;
    wire         s_axi_control_awvalid_sync;
    wire [24:0]  s_axi_control_awaddr_sync;
    wire [7:0]   s_axi_control_awlen_sync;
    wire [2:0]   s_axi_control_awsize_sync;
    wire [1:0]   s_axi_control_awburst_sync;
    wire         s_axi_control_awlock_sync;
    wire [3:0]   s_axi_control_awcache_sync;
    wire [2:0]   s_axi_control_awprot_sync;
    wire [3:0]   s_axi_control_awqos_sync;
    wire [3:0]   s_axi_control_awregion_sync;
    wire [11:0]  s_axi_control_awid_sync;
    wire         s_axi_control_awuser_sync;
    wire         s_axi_control_wready_sync;
    wire         s_axi_control_wvalid_sync;
    wire [31:0]  s_axi_control_wdata_sync;
    wire         s_axi_control_wlast_sync;
    wire [11:0]  s_axi_control_wid_sync;
    wire [3:0]   s_axi_control_wstrb_sync;
    wire         s_axi_control_wuser_sync;
    wire         s_axi_control_bready_sync;
    wire         s_axi_control_bvalid_sync;
    wire [1:0]   s_axi_control_bresp_sync;
    wire [11:0]  s_axi_control_bid_sync;
    wire         s_axi_control_buser_sync;
    wire         s_axi_control_arready_sync;
    wire         s_axi_control_arvalid_sync;
    wire [24:0]  s_axi_control_araddr_sync;
    wire [7:0]   s_axi_control_arlen_sync;
    wire [2:0]   s_axi_control_arsize_sync;
    wire [1:0]   s_axi_control_arburst_sync;
    wire         s_axi_control_arlock_sync;
    wire [3:0]   s_axi_control_arcache_sync;
    wire [2:0]   s_axi_control_arprot_sync;
    wire [3:0]   s_axi_control_arqos_sync;
    wire [3:0]   s_axi_control_arregion_sync;
    wire [11:0]  s_axi_control_arid_sync;
    wire         s_axi_control_aruser_sync;
    wire         s_axi_control_rready_sync;
    wire         s_axi_control_rvalid_sync;
    wire [1:0]   s_axi_control_rresp_sync;
    wire [31:0]  s_axi_control_rdata_sync;
    wire         s_axi_control_rlast_sync;
    wire [11:0]  s_axi_control_rid_sync;
    wire         s_axi_control_ruser_sync;

    axi_clock_converter_s_axi_control s_axi_control_clock_convert (
        .s_axi_aclk(ap_clk),
        .s_axi_aresetn(ap_rst_n),
        .s_axi_awaddr(s_axi_control_awaddr),
        .s_axi_awprot(s_axi_control_awprot),
        .s_axi_awvalid(s_axi_control_awvalid),
        .s_axi_awready(s_axi_control_awready),
        .s_axi_wdata(s_axi_control_wdata),
        .s_axi_wstrb(s_axi_control_wstrb),
        .s_axi_wvalid(s_axi_control_wvalid),
        .s_axi_wready(s_axi_control_wready),
        .s_axi_bresp(s_axi_control_bresp),
        .s_axi_bvalid(s_axi_control_bvalid),
        .s_axi_bready(s_axi_control_bready),
        .s_axi_araddr(s_axi_control_araddr),
        .s_axi_arprot(s_axi_control_arprot),
        .s_axi_arvalid(s_axi_control_arvalid),
        .s_axi_arready(s_axi_control_arready),
        .s_axi_rdata(s_axi_control_rdata),
        .s_axi_rresp(s_axi_control_rresp),
        .s_axi_rvalid(s_axi_control_rvalid),
        .s_axi_rready(s_axi_control_rready),

        .m_axi_aclk(ap_clk_2),
        .m_axi_aresetn(ap_rst_n_2),
        .m_axi_awaddr(s_axi_control_awaddr_sync),
        .m_axi_awprot(s_axi_control_awprot_sync),
        .m_axi_awvalid(s_axi_control_awvalid_sync),
        .m_axi_awready(s_axi_control_awready_sync),
        .m_axi_wdata(s_axi_control_wdata_sync),
        .m_axi_wstrb(s_axi_control_wstrb_sync),
        .m_axi_wvalid(s_axi_control_wvalid_sync),
        .m_axi_wready(s_axi_control_wready_sync),
        .m_axi_bresp(s_axi_control_bresp_sync),
        .m_axi_bvalid(s_axi_control_bvalid_sync),
        .m_axi_bready(s_axi_control_bready_sync),
        .m_axi_araddr(s_axi_control_araddr_sync),
        .m_axi_arprot(s_axi_control_arprot_sync),
        .m_axi_arvalid(s_axi_control_arvalid_sync),
        .m_axi_arready(s_axi_control_arready_sync),
        .m_axi_rdata(s_axi_control_rdata_sync),
        .m_axi_rresp(s_axi_control_rresp_sync),
        .m_axi_rvalid(s_axi_control_rvalid_sync),
        .m_axi_rready(s_axi_control_rready_sync)
    );

    wire         pcie_dma_awready_sync;
    wire         pcie_dma_awvalid_sync;
    wire [63:0]  pcie_dma_awaddr_sync;
    wire [7:0]   pcie_dma_awlen_sync;
    wire [2:0]   pcie_dma_awsize_sync;
    wire [1:0]   pcie_dma_awburst_sync;
    wire         pcie_dma_awlock_sync;
    wire [3:0]   pcie_dma_awcache_sync;
    wire [2:0]   pcie_dma_awprot_sync;
    wire [3:0]   pcie_dma_awqos_sync;
    wire [3:0]   pcie_dma_awregion_sync;
    wire [5:0]   pcie_dma_awid_sync;
    wire         pcie_dma_awuser_sync;
    wire         pcie_dma_wready_sync;
    wire         pcie_dma_wvalid_sync;
    wire [511:0] pcie_dma_wdata_sync;
    wire         pcie_dma_wlast_sync;
    wire [5:0]   pcie_dma_wid_sync;
    wire [63:0]  pcie_dma_wstrb_sync;
    wire         pcie_dma_wuser_sync;
    wire         pcie_dma_bready_sync;
    wire         pcie_dma_bvalid_sync;
    wire [1:0]   pcie_dma_bresp_sync;
    wire [5:0]   pcie_dma_bid_sync;
    wire         pcie_dma_buser_sync;
    wire         pcie_dma_arready_sync;
    wire         pcie_dma_arvalid_sync;
    wire [63:0]  pcie_dma_araddr_sync;
    wire [7:0]   pcie_dma_arlen_sync;
    wire [2:0]   pcie_dma_arsize_sync;
    wire [1:0]   pcie_dma_arburst_sync;
    wire         pcie_dma_arlock_sync;
    wire [3:0]   pcie_dma_arcache_sync;
    wire [2:0]   pcie_dma_arprot_sync;
    wire [3:0]   pcie_dma_arqos_sync;
    wire [3:0]   pcie_dma_arregion_sync;
    wire [5:0]   pcie_dma_arid_sync;
    wire         pcie_dma_aruser_sync;
    wire         pcie_dma_rready_sync;
    wire         pcie_dma_rvalid_sync;
    wire [1:0]   pcie_dma_rresp_sync;
    wire [511:0] pcie_dma_rdata_sync;
    wire         pcie_dma_rlast_sync;
    wire [5:0]   pcie_dma_rid_sync;
    wire         pcie_dma_ruser_sync;

    axi_clock_converter_pcie_dma pcie_dma_clock_convert (
        .s_axi_aclk(ap_clk),
        .s_axi_aresetn(ap_rst_n),
        .s_axi_awid(pcie_dma_awid),
        .s_axi_awaddr(pcie_dma_awaddr),
        .s_axi_awlen(pcie_dma_awlen),
        .s_axi_awsize(pcie_dma_awsize),
        .s_axi_awburst(pcie_dma_awburst),
        .s_axi_awlock(pcie_dma_awlock),
        .s_axi_awcache(pcie_dma_awcache),
        .s_axi_awprot(pcie_dma_awprot),
        .s_axi_awregion(pcie_dma_awregion),
        .s_axi_awqos(pci_dma_awqos),
        .s_axi_awvalid(pcie_dma_awvalid),
        .s_axi_awready(pcie_dma_awready),
        .s_axi_wdata(pcie_dma_wdata),
        .s_axi_wstrb(pcie_dma_wstrb),
        .s_axi_wlast(pcie_dma_wlast),
        .s_axi_wvalid(pcie_dma_wvalid),
        .s_axi_wready(pcie_dma_wready),
        .s_axi_bid(pcie_dma_bid),
        .s_axi_bresp(pcie_dma_bresp),
        .s_axi_bvalid(pcie_dma_bvalid),
        .s_axi_bready(pcie_dma_bready),
        .s_axi_arid(pcie_dma_arid),
        .s_axi_araddr(pcie_dma_araddr),
        .s_axi_arlen(pcie_dma_arlen),
        .s_axi_arsize(pcie_dma_arsize),
        .s_axi_arburst(pcie_dma_arburst),
        .s_axi_arlock(pcie_dma_arlock),
        .s_axi_arcache(pcie_dma_arcache),
        .s_axi_arprot(pcie_dma_arprot),
        .s_axi_arregion(pcie_dma_arregion),
        .s_axi_arqos(pcie_dma_arqos),
        .s_axi_arvalid(pcie_dma_arvalid),
        .s_axi_arready(pcie_dma_arready),
        .s_axi_rid(pcie_dma_rid),
        .s_axi_rdata(pcie_dma_rdata),
        .s_axi_rresp(pcie_dma_rresp),
        .s_axi_rlast(pcie_dma_rlast),
        .s_axi_rvalid(pcie_dma_rvalid),
        .s_axi_rready(pcie_dma_rready),

        .m_axi_aclk(ap_clk_2),
        .m_axi_aresetn(ap_rst_n_2),
        .m_axi_awid(pcie_dma_awid_sync),
        .m_axi_awaddr(pcie_dma_awaddr_sync),
        .m_axi_awlen(pcie_dma_awlen_sync),
        .m_axi_awsize(pcie_dma_awsize_sync),
        .m_axi_awburst(pcie_dma_awburst_sync),
        .m_axi_awlock(pcie_dma_awlock_sync),
        .m_axi_awcache(pcie_dma_awcache_sync),
        .m_axi_awprot(pcie_dma_awprot_sync),
        .m_axi_awregion(pcie_dma_awregion_sync),
        .m_axi_awqos(pcie_dma_awqos_sync),
        .m_axi_awvalid(pcie_dma_awvalid_sync),
        .m_axi_awready(pcie_dma_awready_sync),
        .m_axi_wdata(pcie_dma_wdata_sync),
        .m_axi_wstrb(pcie_dma_wstrb_sync),
        .m_axi_wlast(pcie_dma_wlast_sync),
        .m_axi_wvalid(pcie_dma_wvalid_sync),
        .m_axi_wready(pcie_dma_wready_sync),
        .m_axi_bid(pcie_dma_bid_sync),
        .m_axi_bresp(pcie_dma_bresp_sync),
        .m_axi_bvalid(pcie_dma_bvalid_sync),
        .m_axi_bready(pcie_dma_bready_sync),
        .m_axi_arid(pcie_dma_arid_sync),
        .m_axi_araddr(pcie_dma_araddr_sync),
        .m_axi_arlen(pcie_dma_arlen_sync),
        .m_axi_arsize(pcie_dma_arsize_sync),
        .m_axi_arburst(pcie_dma_arburst_sync),
        .m_axi_arlock(pcie_dma_arlock_sync),
        .m_axi_arcache(pcie_dma_arcache_sync),
        .m_axi_arprot(pcie_dma_arprot_sync),
        .m_axi_arregion(pcie_dma_arregion_sync),
        .m_axi_arqos(pcie_dma_arqos_sync),
        .m_axi_arvalid(pcie_dma_arvalid_sync),
        .m_axi_arready(pcie_dma_arready_sync),
        .m_axi_rid(pcie_dma_rid_sync),
        .m_axi_rdata(pcie_dma_rdata_sync),
        .m_axi_rresp(pcie_dma_rresp_sync),
        .m_axi_rlast(pcie_dma_rlast_sync),
        .m_axi_rvalid(pcie_dma_rvalid_sync),
        .m_axi_rready(pcie_dma_rready_sync)
    );

    wire         ddr_3_awready_sync;
    wire         ddr_3_awvalid_sync;
    wire [15:0]  ddr_3_awid_sync;
    wire [63:0]  ddr_3_awaddr_sync;
    wire [7:0]   ddr_3_awlen_sync;
    wire [2:0]   ddr_3_awsize_sync;
    wire [1:0]   ddr_3_awburst_sync;
    wire         ddr_3_awlock_sync;
    wire [3:0]   ddr_3_awcache_sync;
    wire [2:0]   ddr_3_awprot_sync;
    wire [3:0]   ddr_3_awqos_sync;
    wire         ddr_3_wready_sync;
    wire         ddr_3_wvalid_sync;
    wire [63:0]  ddr_3_wdata_sync;
    wire [7:0]   ddr_3_wstrb_sync;
    wire         ddr_3_wlast_sync;
    wire         ddr_3_bready_sync;
    wire         ddr_3_bvalid_sync;
    wire [15:0]  ddr_3_bid_sync;
    wire [1:0]   ddr_3_bresp_sync;
    wire         ddr_3_arready_sync;
    wire         ddr_3_arvalid_sync;
    wire [15:0]  ddr_3_arid_sync;
    wire [63:0]  ddr_3_araddr_sync;
    wire [7:0]   ddr_3_arlen_sync;
    wire [2:0]   ddr_3_arsize_sync;
    wire [1:0]   ddr_3_arburst_sync;
    wire         ddr_3_arlock_sync;
    wire [3:0]   ddr_3_arcache_sync;
    wire [2:0]   ddr_3_arprot_sync;
    wire [3:0]   ddr_3_arqos_sync;
    wire         ddr_3_rready_sync;
    wire         ddr_3_rvalid_sync;
    wire [15:0]  ddr_3_rid_sync;
    wire [63:0]  ddr_3_rdata_sync;
    wire [1:0]   ddr_3_rresp_sync;
    wire         ddr_3_rlast_sync;

    axi_clock_converter_ddr ddr_3_clock_convert (
        .s_axi_aclk(ap_clk_2),
        .s_axi_aresetn(ap_rst_n_2),
        .s_axi_awid(ddr_3_awid_sync),
        .s_axi_awaddr(ddr_3_awaddr_sync),
        .s_axi_awlen(ddr_3_awlen_sync),
        .s_axi_awsize(ddr_3_awsize_sync),
        .s_axi_awburst(ddr_3_awburst_sync),
        .s_axi_awlock(ddr_3_awlock_sync),
        .s_axi_awcache(ddr3_awcache_sync),
        .s_axi_awprot(ddr_3_awprot_sync),
        .s_axi_awregion(ddr_3_awregion_sync),
        .s_axi_awqos(ddr_3_awqos_sync),
        .s_axi_awvalid(ddr_3_awvalid_sync),
        .s_axi_awready(ddr_3_awready_sync),
        .s_axi_wdata(ddr_3_wdata_sync),
        .s_axi_wstrb(ddr_3_wstrb_sync),
        .s_axi_wlast(ddr_3_wlast_sync),
        .s_axi_wvalid(ddr_3_wvalid_sync),
        .s_axi_wready(ddr_3_wready_sync),
        .s_axi_bid(ddr_3_bid_sync),
        .s_axi_bresp(ddr_3_bresp_sync),
        .s_axi_bvalid(ddr_3_bvalid_sync),
        .s_axi_bready(ddr_3_bready_sync),
        .s_axi_arid(ddr_3_arid_sync),
        .s_axi_araddr(ddr_3_araddr_sync),
        .s_axi_arlen(ddr_3_arlen_sync),
        .s_axi_arsize(ddr_3_arsize_sync),
        .s_axi_arburst(ddr_3_arburst_sync),
        .s_axi_arlock(ddr_3_arlock_sync),
        .s_axi_arcache(ddr_3_arcache_sync),
        .s_axi_arprot(ddr_3_arprot_sync),
        .s_axi_arregion(ddr_3_arregion_sync),
        .s_axi_arqos(ddr_3_arqos_sync),
        .s_axi_arvalid(ddr_3_arvalid_sync),
        .s_axi_arready(ddr_3_arready_sync),
        .s_axi_rid(ddr_3_rid_sync),
        .s_axi_rdata(ddr_3_rdata_sync),
        .s_axi_rresp(ddr_3_rresp_sync),
        .s_axi_rlast(ddr_3_rlast_sync),
        .s_axi_rvalid(ddr_3_rvalid_sync),
        .s_axi_rready(ddr_3_rready_sync),

        .m_axi_aclk(ap_clk),
        .m_axi_aresetn(ap_rst_n),
        .m_axi_awid(ddr_3_awid),
        .m_axi_awaddr(ddr_3_awaddr),
        .m_axi_awlen(ddr_3_awlen),
        .m_axi_awsize(ddr_3_awsize),
        .m_axi_awburst(ddr_3_awburst),
        .m_axi_awlock(ddr_3_awlock),
        .m_axi_awcache(ddr_3_awcache),
        .m_axi_awprot(ddr_3_awprot),
        .m_axi_awregion(ddr_3_awregion),
        .m_axi_awqos(ddr_3_awqos),
        .m_axi_awvalid(ddr_3_awvalid),
        .m_axi_awready(ddr_3_awready),
        .m_axi_wdata(ddr_3_wdata),
        .m_axi_wstrb(ddr_3_wstrb),
        .m_axi_wlast(ddr_3_wlast),
        .m_axi_wvalid(ddr_3_wvalid),
        .m_axi_wready(ddr_3_wready),
        .m_axi_bid(ddr_3_bid),
        .m_axi_bresp(ddr_3_bresp),
        .m_axi_bvalid(ddr_3_bvalid),
        .m_axi_bready(ddr_3_bready),
        .m_axi_arid(ddr_3_arid),
        .m_axi_araddr(ddr_3_araddr),
        .m_axi_arlen(ddr_3_arlen),
        .m_axi_arsize(ddr_3_arsize),
        .m_axi_arburst(ddr_3_arburst),
        .m_axi_arlock(ddr_3_arlock),
        .m_axi_arcache(ddr_3_arcache),
        .m_axi_arprot(ddr_3_arprot),
        .m_axi_arregion(ddr_3_arregion),
        .m_axi_arqos(ddr_3_arqos),
        .m_axi_arvalid(ddr_3_arvalid),
        .m_axi_arready(ddr_3_arready),
        .m_axi_rid(ddr_3_rid),
        .m_axi_rdata(ddr_3_rdata),
        .m_axi_rresp(ddr_3_rresp),
        .m_axi_rlast(ddr_3_rlast),
        .m_axi_rvalid(ddr_3_rvalid),
        .m_axi_rready(ddr_3_rready)
    );

    wire         ddr_2_awready_sync;
    wire         ddr_2_awvalid_sync;
    wire [15:0]  ddr_2_awid_sync;
    wire [63:0]  ddr_2_awaddr_sync;
    wire [7:0]   ddr_2_awlen_sync;
    wire [2:0]   ddr_2_awsize_sync;
    wire [1:0]   ddr_2_awburst_sync;
    wire         ddr_2_awlock_sync;
    wire [3:0]   ddr_2_awcache_sync;
    wire [2:0]   ddr_2_awprot_sync;
    wire [3:0]   ddr_2_awqos_sync;
    wire         ddr_2_wready_sync;
    wire         ddr_2_wvalid_sync;
    wire [63:0]  ddr_2_wdata_sync;
    wire [7:0]   ddr_2_wstrb_sync;
    wire         ddr_2_wlast_sync;
    wire         ddr_2_bready_sync;
    wire         ddr_2_bvalid_sync;
    wire [15:0]  ddr_2_bid_sync;
    wire [1:0]   ddr_2_bresp_sync;
    wire         ddr_2_arready_sync;
    wire         ddr_2_arvalid_sync;
    wire [15:0]  ddr_2_arid_sync;
    wire [63:0]  ddr_2_araddr_sync;
    wire [7:0]   ddr_2_arlen_sync;
    wire [2:0]   ddr_2_arsize_sync;
    wire [1:0]   ddr_2_arburst_sync;
    wire         ddr_2_arlock_sync;
    wire [3:0]   ddr_2_arcache_sync;
    wire [2:0]   ddr_2_arprot_sync;
    wire [3:0]   ddr_2_arqos_sync;
    wire         ddr_2_rready_sync;
    wire         ddr_2_rvalid_sync;
    wire [15:0]  ddr_2_rid_sync;
    wire [63:0]  ddr_2_rdata_sync;
    wire [1:0]   ddr_2_rresp_sync;
    wire         ddr_2_rlast_sync;

    axi_clock_converter_ddr ddr_2_clock_convert (
        .s_axi_aclk(ap_clk_2),
        .s_axi_aresetn(ap_rst_n_2),
        .s_axi_awid(ddr_2_awid_sync),
        .s_axi_awaddr(ddr_2_awaddr_sync),
        .s_axi_awlen(ddr_2_awlen_sync),
        .s_axi_awsize(ddr_2_awsize_sync),
        .s_axi_awburst(ddr_2_awburst_sync),
        .s_axi_awlock(ddr_2_awlock_sync),
        .s_axi_awcache(ddr2_awcache_sync),
        .s_axi_awprot(ddr_2_awprot_sync),
        .s_axi_awregion(ddr_2_awregion_sync),
        .s_axi_awqos(ddr_2_awqos_sync),
        .s_axi_awvalid(ddr_2_awvalid_sync),
        .s_axi_awready(ddr_2_awready_sync),
        .s_axi_wdata(ddr_2_wdata_sync),
        .s_axi_wstrb(ddr_2_wstrb_sync),
        .s_axi_wlast(ddr_2_wlast_sync),
        .s_axi_wvalid(ddr_2_wvalid_sync),
        .s_axi_wready(ddr_2_wready_sync),
        .s_axi_bid(ddr_2_bid_sync),
        .s_axi_bresp(ddr_2_bresp_sync),
        .s_axi_bvalid(ddr_2_bvalid_sync),
        .s_axi_bready(ddr_2_bready_sync),
        .s_axi_arid(ddr_2_arid_sync),
        .s_axi_araddr(ddr_2_araddr_sync),
        .s_axi_arlen(ddr_2_arlen_sync),
        .s_axi_arsize(ddr_2_arsize_sync),
        .s_axi_arburst(ddr_2_arburst_sync),
        .s_axi_arlock(ddr_2_arlock_sync),
        .s_axi_arcache(ddr_2_arcache_sync),
        .s_axi_arprot(ddr_2_arprot_sync),
        .s_axi_arregion(ddr_2_arregion_sync),
        .s_axi_arqos(ddr_2_arqos_sync),
        .s_axi_arvalid(ddr_2_arvalid_sync),
        .s_axi_arready(ddr_2_arready_sync),
        .s_axi_rid(ddr_2_rid_sync),
        .s_axi_rdata(ddr_2_rdata_sync),
        .s_axi_rresp(ddr_2_rresp_sync),
        .s_axi_rlast(ddr_2_rlast_sync),
        .s_axi_rvalid(ddr_2_rvalid_sync),
        .s_axi_rready(ddr_2_rready_sync),

        .m_axi_aclk(ap_clk),
        .m_axi_aresetn(ap_rst_n),
        .m_axi_awid(ddr_2_awid),
        .m_axi_awaddr(ddr_2_awaddr),
        .m_axi_awlen(ddr_2_awlen),
        .m_axi_awsize(ddr_2_awsize),
        .m_axi_awburst(ddr_2_awburst),
        .m_axi_awlock(ddr_2_awlock),
        .m_axi_awcache(ddr_2_awcache),
        .m_axi_awprot(ddr_2_awprot),
        .m_axi_awregion(ddr_2_awregion),
        .m_axi_awqos(ddr_2_awqos),
        .m_axi_awvalid(ddr_2_awvalid),
        .m_axi_awready(ddr_2_awready),
        .m_axi_wdata(ddr_2_wdata),
        .m_axi_wstrb(ddr_2_wstrb),
        .m_axi_wlast(ddr_2_wlast),
        .m_axi_wvalid(ddr_2_wvalid),
        .m_axi_wready(ddr_2_wready),
        .m_axi_bid(ddr_2_bid),
        .m_axi_bresp(ddr_2_bresp),
        .m_axi_bvalid(ddr_2_bvalid),
        .m_axi_bready(ddr_2_bready),
        .m_axi_arid(ddr_2_arid),
        .m_axi_araddr(ddr_2_araddr),
        .m_axi_arlen(ddr_2_arlen),
        .m_axi_arsize(ddr_2_arsize),
        .m_axi_arburst(ddr_2_arburst),
        .m_axi_arlock(ddr_2_arlock),
        .m_axi_arcache(ddr_2_arcache),
        .m_axi_arprot(ddr_2_arprot),
        .m_axi_arregion(ddr_2_arregion),
        .m_axi_arqos(ddr_2_arqos),
        .m_axi_arvalid(ddr_2_arvalid),
        .m_axi_arready(ddr_2_arready),
        .m_axi_rid(ddr_2_rid),
        .m_axi_rdata(ddr_2_rdata),
        .m_axi_rresp(ddr_2_rresp),
        .m_axi_rlast(ddr_2_rlast),
        .m_axi_rvalid(ddr_2_rvalid),
        .m_axi_rready(ddr_2_rready)
    );

    wire         ddr_1_awready_sync;
    wire         ddr_1_awvalid_sync;
    wire [15:0]  ddr_1_awid_sync;
    wire [63:0]  ddr_1_awaddr_sync;
    wire [7:0]   ddr_1_awlen_sync;
    wire [2:0]   ddr_1_awsize_sync;
    wire [1:0]   ddr_1_awburst_sync;
    wire         ddr_1_awlock_sync;
    wire [3:0]   ddr_1_awcache_sync;
    wire [2:0]   ddr_1_awprot_sync;
    wire [3:0]   ddr_1_awqos_sync;
    wire         ddr_1_wready_sync;
    wire         ddr_1_wvalid_sync;
    wire [63:0]  ddr_1_wdata_sync;
    wire [7:0]   ddr_1_wstrb_sync;
    wire         ddr_1_wlast_sync;
    wire         ddr_1_bready_sync;
    wire         ddr_1_bvalid_sync;
    wire [15:0]  ddr_1_bid_sync;
    wire [1:0]   ddr_1_bresp_sync;
    wire         ddr_1_arready_sync;
    wire         ddr_1_arvalid_sync;
    wire [15:0]  ddr_1_arid_sync;
    wire [63:0]  ddr_1_araddr_sync;
    wire [7:0]   ddr_1_arlen_sync;
    wire [2:0]   ddr_1_arsize_sync;
    wire [1:0]   ddr_1_arburst_sync;
    wire         ddr_1_arlock_sync;
    wire [3:0]   ddr_1_arcache_sync;
    wire [2:0]   ddr_1_arprot_sync;
    wire [3:0]   ddr_1_arqos_sync;
    wire         ddr_1_rready_sync;
    wire         ddr_1_rvalid_sync;
    wire [15:0]  ddr_1_rid_sync;
    wire [63:0]  ddr_1_rdata_sync;
    wire [1:0]   ddr_1_rresp_sync;
    wire         ddr_1_rlast_sync;

    axi_clock_converter_ddr ddr_1_clock_convert (
        .s_axi_aclk(ap_clk_2),
        .s_axi_aresetn(ap_rst_n_2),
        .s_axi_awid(ddr_1_awid_sync),
        .s_axi_awaddr(ddr_1_awaddr_sync),
        .s_axi_awlen(ddr_1_awlen_sync),
        .s_axi_awsize(ddr_1_awsize_sync),
        .s_axi_awburst(ddr_1_awburst_sync),
        .s_axi_awlock(ddr_1_awlock_sync),
        .s_axi_awcache(ddr1_awcache_sync),
        .s_axi_awprot(ddr_1_awprot_sync),
        .s_axi_awregion(ddr_1_awregion_sync),
        .s_axi_awqos(ddr_1_awqos_sync),
        .s_axi_awvalid(ddr_1_awvalid_sync),
        .s_axi_awready(ddr_1_awready_sync),
        .s_axi_wdata(ddr_1_wdata_sync),
        .s_axi_wstrb(ddr_1_wstrb_sync),
        .s_axi_wlast(ddr_1_wlast_sync),
        .s_axi_wvalid(ddr_1_wvalid_sync),
        .s_axi_wready(ddr_1_wready_sync),
        .s_axi_bid(ddr_1_bid_sync),
        .s_axi_bresp(ddr_1_bresp_sync),
        .s_axi_bvalid(ddr_1_bvalid_sync),
        .s_axi_bready(ddr_1_bready_sync),
        .s_axi_arid(ddr_1_arid_sync),
        .s_axi_araddr(ddr_1_araddr_sync),
        .s_axi_arlen(ddr_1_arlen_sync),
        .s_axi_arsize(ddr_1_arsize_sync),
        .s_axi_arburst(ddr_1_arburst_sync),
        .s_axi_arlock(ddr_1_arlock_sync),
        .s_axi_arcache(ddr_1_arcache_sync),
        .s_axi_arprot(ddr_1_arprot_sync),
        .s_axi_arregion(ddr_1_arregion_sync),
        .s_axi_arqos(ddr_1_arqos_sync),
        .s_axi_arvalid(ddr_1_arvalid_sync),
        .s_axi_arready(ddr_1_arready_sync),
        .s_axi_rid(ddr_1_rid_sync),
        .s_axi_rdata(ddr_1_rdata_sync),
        .s_axi_rresp(ddr_1_rresp_sync),
        .s_axi_rlast(ddr_1_rlast_sync),
        .s_axi_rvalid(ddr_1_rvalid_sync),
        .s_axi_rready(ddr_1_rready_sync),

        .m_axi_aclk(ap_clk),
        .m_axi_aresetn(ap_rst_n),
        .m_axi_awid(ddr_1_awid),
        .m_axi_awaddr(ddr_1_awaddr),
        .m_axi_awlen(ddr_1_awlen),
        .m_axi_awsize(ddr_1_awsize),
        .m_axi_awburst(ddr_1_awburst),
        .m_axi_awlock(ddr_1_awlock),
        .m_axi_awcache(ddr_1_awcache),
        .m_axi_awprot(ddr_1_awprot),
        .m_axi_awregion(ddr_1_awregion),
        .m_axi_awqos(ddr_1_awqos),
        .m_axi_awvalid(ddr_1_awvalid),
        .m_axi_awready(ddr_1_awready),
        .m_axi_wdata(ddr_1_wdata),
        .m_axi_wstrb(ddr_1_wstrb),
        .m_axi_wlast(ddr_1_wlast),
        .m_axi_wvalid(ddr_1_wvalid),
        .m_axi_wready(ddr_1_wready),
        .m_axi_bid(ddr_1_bid),
        .m_axi_bresp(ddr_1_bresp),
        .m_axi_bvalid(ddr_1_bvalid),
        .m_axi_bready(ddr_1_bready),
        .m_axi_arid(ddr_1_arid),
        .m_axi_araddr(ddr_1_araddr),
        .m_axi_arlen(ddr_1_arlen),
        .m_axi_arsize(ddr_1_arsize),
        .m_axi_arburst(ddr_1_arburst),
        .m_axi_arlock(ddr_1_arlock),
        .m_axi_arcache(ddr_1_arcache),
        .m_axi_arprot(ddr_1_arprot),
        .m_axi_arregion(ddr_1_arregion),
        .m_axi_arqos(ddr_1_arqos),
        .m_axi_arvalid(ddr_1_arvalid),
        .m_axi_arready(ddr_1_arready),
        .m_axi_rid(ddr_1_rid),
        .m_axi_rdata(ddr_1_rdata),
        .m_axi_rresp(ddr_1_rresp),
        .m_axi_rlast(ddr_1_rlast),
        .m_axi_rvalid(ddr_1_rvalid),
        .m_axi_rready(ddr_1_rready)
    );

    wire         ddr_0_awready_sync;
    wire         ddr_0_awvalid_sync;
    wire [15:0]  ddr_0_awid_sync;
    wire [63:0]  ddr_0_awaddr_sync;
    wire [7:0]   ddr_0_awlen_sync;
    wire [2:0]   ddr_0_awsize_sync;
    wire [1:0]   ddr_0_awburst_sync;
    wire         ddr_0_awlock_sync;
    wire [3:0]   ddr_0_awcache_sync;
    wire [2:0]   ddr_0_awprot_sync;
    wire [3:0]   ddr_0_awqos_sync;
    wire         ddr_0_wready_sync;
    wire         ddr_0_wvalid_sync;
    wire [63:0]  ddr_0_wdata_sync;
    wire [7:0]   ddr_0_wstrb_sync;
    wire         ddr_0_wlast_sync;
    wire         ddr_0_bready_sync;
    wire         ddr_0_bvalid_sync;
    wire [15:0]  ddr_0_bid_sync;
    wire [1:0]   ddr_0_bresp_sync;
    wire         ddr_0_arready_sync;
    wire         ddr_0_arvalid_sync;
    wire [15:0]  ddr_0_arid_sync;
    wire [63:0]  ddr_0_araddr_sync;
    wire [7:0]   ddr_0_arlen_sync;
    wire [2:0]   ddr_0_arsize_sync;
    wire [1:0]   ddr_0_arburst_sync;
    wire         ddr_0_arlock_sync;
    wire [3:0]   ddr_0_arcache_sync;
    wire [2:0]   ddr_0_arprot_sync;
    wire [3:0]   ddr_0_arqos_sync;
    wire         ddr_0_rready_sync;
    wire         ddr_0_rvalid_sync;
    wire [15:0]  ddr_0_rid_sync;
    wire [63:0]  ddr_0_rdata_sync;
    wire [1:0]   ddr_0_rresp_sync;
    wire         ddr_0_rlast_sync;

    axi_clock_converter_ddr ddr_0_clock_convert (
        .s_axi_aclk(ap_clk_2),
        .s_axi_aresetn(ap_rst_n_2),
        .s_axi_awid(ddr_0_awid_sync),
        .s_axi_awaddr(ddr_0_awaddr_sync),
        .s_axi_awlen(ddr_0_awlen_sync),
        .s_axi_awsize(ddr_0_awsize_sync),
        .s_axi_awburst(ddr_0_awburst_sync),
        .s_axi_awlock(ddr_0_awlock_sync),
        .s_axi_awcache(ddr0_awcache_sync),
        .s_axi_awprot(ddr_0_awprot_sync),
        .s_axi_awregion(ddr_0_awregion_sync),
        .s_axi_awqos(ddr_0_awqos_sync),
        .s_axi_awvalid(ddr_0_awvalid_sync),
        .s_axi_awready(ddr_0_awready_sync),
        .s_axi_wdata(ddr_0_wdata_sync),
        .s_axi_wstrb(ddr_0_wstrb_sync),
        .s_axi_wlast(ddr_0_wlast_sync),
        .s_axi_wvalid(ddr_0_wvalid_sync),
        .s_axi_wready(ddr_0_wready_sync),
        .s_axi_bid(ddr_0_bid_sync),
        .s_axi_bresp(ddr_0_bresp_sync),
        .s_axi_bvalid(ddr_0_bvalid_sync),
        .s_axi_bready(ddr_0_bready_sync),
        .s_axi_arid(ddr_0_arid_sync),
        .s_axi_araddr(ddr_0_araddr_sync),
        .s_axi_arlen(ddr_0_arlen_sync),
        .s_axi_arsize(ddr_0_arsize_sync),
        .s_axi_arburst(ddr_0_arburst_sync),
        .s_axi_arlock(ddr_0_arlock_sync),
        .s_axi_arcache(ddr_0_arcache_sync),
        .s_axi_arprot(ddr_0_arprot_sync),
        .s_axi_arregion(ddr_0_arregion_sync),
        .s_axi_arqos(ddr_0_arqos_sync),
        .s_axi_arvalid(ddr_0_arvalid_sync),
        .s_axi_arready(ddr_0_arready_sync),
        .s_axi_rid(ddr_0_rid_sync),
        .s_axi_rdata(ddr_0_rdata_sync),
        .s_axi_rresp(ddr_0_rresp_sync),
        .s_axi_rlast(ddr_0_rlast_sync),
        .s_axi_rvalid(ddr_0_rvalid_sync),
        .s_axi_rready(ddr_0_rready_sync),

        .m_axi_aclk(ap_clk),
        .m_axi_aresetn(ap_rst_n),
        .m_axi_awid(ddr_0_awid),
        .m_axi_awaddr(ddr_0_awaddr),
        .m_axi_awlen(ddr_0_awlen),
        .m_axi_awsize(ddr_0_awsize),
        .m_axi_awburst(ddr_0_awburst),
        .m_axi_awlock(ddr_0_awlock),
        .m_axi_awcache(ddr_0_awcache),
        .m_axi_awprot(ddr_0_awprot),
        .m_axi_awregion(ddr_0_awregion),
        .m_axi_awqos(ddr_0_awqos),
        .m_axi_awvalid(ddr_0_awvalid),
        .m_axi_awready(ddr_0_awready),
        .m_axi_wdata(ddr_0_wdata),
        .m_axi_wstrb(ddr_0_wstrb),
        .m_axi_wlast(ddr_0_wlast),
        .m_axi_wvalid(ddr_0_wvalid),
        .m_axi_wready(ddr_0_wready),
        .m_axi_bid(ddr_0_bid),
        .m_axi_bresp(ddr_0_bresp),
        .m_axi_bvalid(ddr_0_bvalid),
        .m_axi_bready(ddr_0_bready),
        .m_axi_arid(ddr_0_arid),
        .m_axi_araddr(ddr_0_araddr),
        .m_axi_arlen(ddr_0_arlen),
        .m_axi_arsize(ddr_0_arsize),
        .m_axi_arburst(ddr_0_arburst),
        .m_axi_arlock(ddr_0_arlock),
        .m_axi_arcache(ddr_0_arcache),
        .m_axi_arprot(ddr_0_arprot),
        .m_axi_arregion(ddr_0_arregion),
        .m_axi_arqos(ddr_0_arqos),
        .m_axi_arvalid(ddr_0_arvalid),
        .m_axi_arready(ddr_0_arready),
        .m_axi_rid(ddr_0_rid),
        .m_axi_rdata(ddr_0_rdata),
        .m_axi_rresp(ddr_0_rresp),
        .m_axi_rlast(ddr_0_rlast),
        .m_axi_rvalid(ddr_0_rvalid),
        .m_axi_rready(ddr_0_rready)
    );

    // ------------------------------------------------

    wire [33:0] io_slave_0_awaddr_sync;
    wire [33:0] io_slave_0_araddr_sync;

    wire [33:0] io_slave_1_awaddr_sync;
    wire [33:0] io_slave_1_araddr_sync;

    wire [33:0] io_slave_2_awaddr_sync;
    wire [33:0] io_slave_2_araddr_sync;

    wire [33:0] io_slave_3_awaddr_sync;
    wire [33:0] io_slave_3_araddr_sync;

    F1Shim f1Shim (
        .clock(ap_clk_2),
        .reset(!ap_rst_n_2),
        .io_master_aw_ready(s_axi_control_awready_sync),
        .io_master_aw_valid(s_axi_control_awvalid_sync),
        .io_master_aw_bits_addr(s_axi_control_awaddr_sync),
        .io_master_aw_bits_len(s_axi_control_awlen_sync),
        .io_master_aw_bits_size(s_axi_control_awsize_sync),
        .io_master_aw_bits_burst(s_axi_control_awburst_sync),
        .io_master_aw_bits_lock(s_axi_control_awlock_sync),
        .io_master_aw_bits_cache(s_axi_control_awcache_sync),
        .io_master_aw_bits_prot(s_axi_control_awprot_sync),
        .io_master_aw_bits_qos(s_axi_control_awqos_sync),
        .io_master_aw_bits_region(s_axi_control_awregion_sync),
        .io_master_aw_bits_id(s_axi_control_awid_sync),
        .io_master_aw_bits_user(s_axi_control_awuser_sync),
        .io_master_w_ready(s_axi_control_wready_sync),
        .io_master_w_valid(s_axi_control_wvalid_sync),
        .io_master_w_bits_data(s_axi_control_wdata_sync),
        .io_master_w_bits_last(s_axi_control_wlast_sync),
        .io_master_w_bits_id(s_axi_control_wid_sync),
        .io_master_w_bits_strb(s_axi_control_wstrb_sync),
        .io_master_w_bits_user(s_axi_control_wuser_sync),
        .io_master_b_ready(s_axi_control_bready_sync),
        .io_master_b_valid(s_axi_control_bvalid_sync),
        .io_master_b_bits_resp(s_axi_control_bresp_sync),
        .io_master_b_bits_id(s_axi_control_bid_sync),
        .io_master_b_bits_user(s_axi_control_buser_sync),
        .io_master_ar_ready(s_axi_control_arready_sync),
        .io_master_ar_valid(s_axi_control_arvalid_sync),
        .io_master_ar_bits_addr(s_axi_control_araddr_sync),
        .io_master_ar_bits_len(s_axi_control_arlen_sync),
        .io_master_ar_bits_size(s_axi_control_arsize_sync),
        .io_master_ar_bits_burst(s_axi_control_arburst_sync),
        .io_master_ar_bits_lock(s_axi_control_arlock_sync),
        .io_master_ar_bits_cache(s_axi_control_arcache_sync),
        .io_master_ar_bits_prot(s_axi_control_arprot_sync),
        .io_master_ar_bits_qos(s_axi_control_arqos_sync),
        .io_master_ar_bits_region(s_axi_control_arregion_sync),
        .io_master_ar_bits_id(s_axi_control_arid_sync),
        .io_master_ar_bits_user(s_axi_control_aruser_sync),
        .io_master_r_ready(s_axi_control_rready_sync),
        .io_master_r_valid(s_axi_control_rvalid_sync),
        .io_master_r_bits_resp(s_axi_control_rresp_sync),
        .io_master_r_bits_data(s_axi_control_rdata_sync),
        .io_master_r_bits_last(s_axi_control_rlast_sync),
        .io_master_r_bits_id(s_axi_control_rid_sync),
        .io_master_r_bits_user(s_axi_control_ruser_sync),
        .io_dma_aw_ready(pcie_dma_awready_sync),
        .io_dma_aw_valid(pcie_dma_awvalid_sync),
        .io_dma_aw_bits_addr(pcie_dma_awaddr_sync),
        .io_dma_aw_bits_len(pcie_dma_awlen_sync),
        .io_dma_aw_bits_size(pcie_dma_awsize_sync),
        .io_dma_aw_bits_burst(pcie_dma_awburst_sync),
        .io_dma_aw_bits_lock(pcie_dma_awlock_sync),
        .io_dma_aw_bits_cache(pcie_dma_awcache_sync),
        .io_dma_aw_bits_prot(pcie_dma_awprot_sync),
        .io_dma_aw_bits_qos(pcie_dma_awqos_sync),
        .io_dma_aw_bits_region(pcie_dma_awregion_sync),
        .io_dma_aw_bits_id(pcie_dma_awid_sync),
        .io_dma_aw_bits_user(pcie_dma_awuser_sync),
        .io_dma_w_ready(pcie_dma_wready_sync),
        .io_dma_w_valid(pcie_dma_wvalid_sync),
        .io_dma_w_bits_data(pcie_dma_wdata_sync),
        .io_dma_w_bits_last(pcie_dma_wlast_sync),
        .io_dma_w_bits_id(pcie_dma_wid_sync),
        .io_dma_w_bits_strb(pcie_dma_wstrb_sync),
        .io_dma_w_bits_user(pcie_dma_wuser_sync),
        .io_dma_b_ready(pcie_dma_bready_sync),
        .io_dma_b_valid(pcie_dma_bvalid_sync),
        .io_dma_b_bits_resp(pcie_dma_bresp_sync),
        .io_dma_b_bits_id(pcie_dma_bid_sync),
        .io_dma_b_bits_user(pcie_dma_buser_sync),
        .io_dma_ar_ready(pcie_dma_arready_sync),
        .io_dma_ar_valid(pcie_dma_arvalid_sync),
        .io_dma_ar_bits_addr(pcie_dma_araddr_sync),
        .io_dma_ar_bits_len(pcie_dma_arlen_sync),
        .io_dma_ar_bits_size(pcie_dma_arsize_sync),
        .io_dma_ar_bits_burst(pcie_dma_arburst_sync),
        .io_dma_ar_bits_lock(pcie_dma_arlock_sync),
        .io_dma_ar_bits_cache(pcie_dma_arcache_sync),
        .io_dma_ar_bits_prot(pcie_dma_arprot_sync),
        .io_dma_ar_bits_qos(pcie_dma_arqos_sync),
        .io_dma_ar_bits_region(pcie_dma_arregion_sync),
        .io_dma_ar_bits_id(pcie_dma_arid_sync),
        .io_dma_ar_bits_user(pcie_dma_aruser_sync),
        .io_dma_r_ready(pcie_dma_rready_sync),
        .io_dma_r_valid(pcie_dma_rvalid_sync),
        .io_dma_r_bits_resp(pcie_dma_rresp_sync),
        .io_dma_r_bits_data(pcie_dma_rdata_sync),
        .io_dma_r_bits_last(pcie_dma_rlast_sync),
        .io_dma_r_bits_id(pcie_dma_rid_sync),
        .io_dma_r_bits_user(pcie_dma_ruser_sync),
        .io_slave_3_aw_ready(ddr_3_awready_sync),
        .io_slave_3_aw_valid(ddr_3_awvalid_sync),
        .io_slave_3_aw_bits_id(ddr_3_awid_sync),
        .io_slave_3_aw_bits_addr(io_slave_3_awaddr_sync),
        .io_slave_3_aw_bits_len(ddr_3_awlen_sync),
        .io_slave_3_aw_bits_size(ddr_3_awsize_sync),
        .io_slave_3_aw_bits_burst(ddr_3_awburst_sync),
        .io_slave_3_aw_bits_lock(ddr_3_awlock_sync),
        .io_slave_3_aw_bits_cache(ddr_3_awcache_sync),
        .io_slave_3_aw_bits_prot(ddr_3_awprot_sync),
        .io_slave_3_aw_bits_qos(ddr_3_awqos_sync),
        .io_slave_3_w_ready(ddr_3_wready_sync),
        .io_slave_3_w_valid(ddr_3_wvalid_sync),
        .io_slave_3_w_bits_data(ddr_3_wdata_sync),
        .io_slave_3_w_bits_strb(ddr_3_wstrb_sync),
        .io_slave_3_w_bits_last(ddr_3_wlast_sync),
        .io_slave_3_b_ready(ddr_3_bready_sync),
        .io_slave_3_b_valid(ddr_3_bvalid_sync),
        .io_slave_3_b_bits_id(ddr_3_bid_sync),
        .io_slave_3_b_bits_resp(ddr_3_bresp_sync),
        .io_slave_3_ar_ready(ddr_3_arready_sync),
        .io_slave_3_ar_valid(ddr_3_arvalid_sync),
        .io_slave_3_ar_bits_id(ddr_3_arid_sync),
        .io_slave_3_ar_bits_addr(io_slave_3_araddr_sync),
        .io_slave_3_ar_bits_len(ddr_3_arlen_sync),
        .io_slave_3_ar_bits_size(ddr_3_arsize_sync),
        .io_slave_3_ar_bits_burst(ddr_3_arburst_sync),
        .io_slave_3_ar_bits_lock(ddr_3_arlock_sync),
        .io_slave_3_ar_bits_cache(ddr_3_arcache_sync),
        .io_slave_3_ar_bits_prot(ddr_3_arprot_sync),
        .io_slave_3_ar_bits_qos(ddr_3_arqos_sync),
        .io_slave_3_r_ready(ddr_3_rready_sync),
        .io_slave_3_r_valid(ddr_3_rvalid_sync),
        .io_slave_3_r_bits_id(ddr_3_rid_sync),
        .io_slave_3_r_bits_data(ddr_3_rdata_sync),
        .io_slave_3_r_bits_resp(ddr_3_rresp_sync),
        .io_slave_3_r_bits_last(ddr_3_rlast_sync),
        .io_slave_2_aw_ready(ddr_2_awready_sync),
        .io_slave_2_aw_valid(ddr_2_awvalid_sync),
        .io_slave_2_aw_bits_id(ddr_2_awid_sync),
        .io_slave_2_aw_bits_addr(io_slave_2_awaddr_sync),
        .io_slave_2_aw_bits_len(ddr_2_awlen_sync),
        .io_slave_2_aw_bits_size(ddr_2_awsize_sync),
        .io_slave_2_aw_bits_burst(ddr_2_awburst_sync),
        .io_slave_2_aw_bits_lock(ddr_2_awlock_sync),
        .io_slave_2_aw_bits_cache(ddr_2_awcache_sync),
        .io_slave_2_aw_bits_prot(ddr_2_awprot_sync),
        .io_slave_2_aw_bits_qos(ddr_2_awqos_sync),
        .io_slave_2_w_ready(ddr_2_wready_sync),
        .io_slave_2_w_valid(ddr_2_wvalid_sync),
        .io_slave_2_w_bits_data(ddr_2_wdata_sync),
        .io_slave_2_w_bits_strb(ddr_2_wstrb_sync),
        .io_slave_2_w_bits_last(ddr_2_wlast_sync),
        .io_slave_2_b_ready(ddr_2_bready_sync),
        .io_slave_2_b_valid(ddr_2_bvalid_sync),
        .io_slave_2_b_bits_id(ddr_2_bid_sync),
        .io_slave_2_b_bits_resp(ddr_2_bresp_sync),
        .io_slave_2_ar_ready(ddr_2_arready_sync),
        .io_slave_2_ar_valid(ddr_2_arvalid_sync),
        .io_slave_2_ar_bits_id(ddr_2_arid_sync),
        .io_slave_2_ar_bits_addr(io_slave_2_araddr_sync),
        .io_slave_2_ar_bits_len(ddr_2_arlen_sync),
        .io_slave_2_ar_bits_size(ddr_2_arsize_sync),
        .io_slave_2_ar_bits_burst(ddr_2_arburst_sync),
        .io_slave_2_ar_bits_lock(ddr_2_arlock_sync),
        .io_slave_2_ar_bits_cache(ddr_2_arcache_sync),
        .io_slave_2_ar_bits_prot(ddr_2_arprot_sync),
        .io_slave_2_ar_bits_qos(ddr_2_arqos_sync),
        .io_slave_2_r_ready(ddr_2_rready_sync),
        .io_slave_2_r_valid(ddr_2_rvalid_sync),
        .io_slave_2_r_bits_id(ddr_2_rid_sync),
        .io_slave_2_r_bits_data(ddr_2_rdata_sync),
        .io_slave_2_r_bits_resp(ddr_2_rresp_sync),
        .io_slave_2_r_bits_last(ddr_2_rlast_sync),
        .io_slave_1_aw_ready(ddr_1_awready_sync),
        .io_slave_1_aw_valid(ddr_1_awvalid_sync),
        .io_slave_1_aw_bits_id(ddr_1_awid_sync),
        .io_slave_1_aw_bits_addr(io_slave_1_awaddr_sync),
        .io_slave_1_aw_bits_len(ddr_1_awlen_sync),
        .io_slave_1_aw_bits_size(ddr_1_awsize_sync),
        .io_slave_1_aw_bits_burst(ddr_1_awburst_sync),
        .io_slave_1_aw_bits_lock(ddr_1_awlock_sync),
        .io_slave_1_aw_bits_cache(ddr_1_awcache_sync),
        .io_slave_1_aw_bits_prot(ddr_1_awprot_sync),
        .io_slave_1_aw_bits_qos(ddr_1_awqos_sync),
        .io_slave_1_w_ready(ddr_1_wready_sync),
        .io_slave_1_w_valid(ddr_1_wvalid_sync),
        .io_slave_1_w_bits_data(ddr_1_wdata_sync),
        .io_slave_1_w_bits_strb(ddr_1_wstrb_sync),
        .io_slave_1_w_bits_last(ddr_1_wlast_sync),
        .io_slave_1_b_ready(ddr_1_bready_sync),
        .io_slave_1_b_valid(ddr_1_bvalid_sync),
        .io_slave_1_b_bits_id(ddr_1_bid_sync),
        .io_slave_1_b_bits_resp(ddr_1_bresp_sync),
        .io_slave_1_ar_ready(ddr_1_arready_sync),
        .io_slave_1_ar_valid(ddr_1_arvalid_sync),
        .io_slave_1_ar_bits_id(ddr_1_arid_sync),
        .io_slave_1_ar_bits_addr(io_slave_1_araddr_sync),
        .io_slave_1_ar_bits_len(ddr_1_arlen_sync),
        .io_slave_1_ar_bits_size(ddr_1_arsize_sync),
        .io_slave_1_ar_bits_burst(ddr_1_arburst_sync),
        .io_slave_1_ar_bits_lock(ddr_1_arlock_sync),
        .io_slave_1_ar_bits_cache(ddr_1_arcache_sync),
        .io_slave_1_ar_bits_prot(ddr_1_arprot_sync),
        .io_slave_1_ar_bits_qos(ddr_1_arqos_sync),
        .io_slave_1_r_ready(ddr_1_rready_sync),
        .io_slave_1_r_valid(ddr_1_rvalid_sync),
        .io_slave_1_r_bits_id(ddr_1_rid_sync),
        .io_slave_1_r_bits_data(ddr_1_rdata_sync),
        .io_slave_1_r_bits_resp(ddr_1_rresp_sync),
        .io_slave_1_r_bits_last(ddr_1_rlast_sync),
        .io_slave_0_aw_ready(ddr_0_awready_sync),
        .io_slave_0_aw_valid(ddr_0_awvalid_sync),
        .io_slave_0_aw_bits_id(ddr_0_awid_sync),
        .io_slave_0_aw_bits_addr(io_slave_0_awaddr_sync),
        .io_slave_0_aw_bits_len(ddr_0_awlen_sync),
        .io_slave_0_aw_bits_size(ddr_0_awsize_sync),
        .io_slave_0_aw_bits_burst(ddr_0_awburst_sync),
        .io_slave_0_aw_bits_lock(ddr_0_awlock_sync),
        .io_slave_0_aw_bits_cache(ddr_0_awcache_sync),
        .io_slave_0_aw_bits_prot(ddr_0_awprot_sync),
        .io_slave_0_aw_bits_qos(ddr_0_awqos_sync),
        .io_slave_0_w_ready(ddr_0_wready_sync),
        .io_slave_0_w_valid(ddr_0_wvalid_sync),
        .io_slave_0_w_bits_data(ddr_0_wdata_sync),
        .io_slave_0_w_bits_strb(ddr_0_wstrb_sync),
        .io_slave_0_w_bits_last(ddr_0_wlast_sync),
        .io_slave_0_b_ready(ddr_0_bready_sync),
        .io_slave_0_b_valid(ddr_0_bvalid_sync),
        .io_slave_0_b_bits_id(ddr_0_bid_sync),
        .io_slave_0_b_bits_resp(ddr_0_bresp_sync),
        .io_slave_0_ar_ready(ddr_0_arready_sync),
        .io_slave_0_ar_valid(ddr_0_arvalid_sync),
        .io_slave_0_ar_bits_id(ddr_0_arid_sync),
        .io_slave_0_ar_bits_addr(io_slave_0_araddr_sync),
        .io_slave_0_ar_bits_len(ddr_0_arlen_sync),
        .io_slave_0_ar_bits_size(ddr_0_arsize_sync),
        .io_slave_0_ar_bits_burst(ddr_0_arburst_sync),
        .io_slave_0_ar_bits_lock(ddr_0_arlock_sync),
        .io_slave_0_ar_bits_cache(ddr_0_arcache_sync),
        .io_slave_0_ar_bits_prot(ddr_0_arprot_sync),
        .io_slave_0_ar_bits_qos(ddr_0_arqos_sync),
        .io_slave_0_r_ready(ddr_0_rready_sync),
        .io_slave_0_r_valid(ddr_0_rvalid_sync),
        .io_slave_0_r_bits_id(ddr_0_rid_sync),
        .io_slave_0_r_bits_data(ddr_0_rdata_sync),
        .io_slave_0_r_bits_resp(ddr_0_rresp_sync),
        .io_slave_0_r_bits_last(ddr_0_rlast_sync)
    );

    assign ddr_0_awaddr_sync = {{30{1'b0}}, io_slave_0_awaddr_sync};
    assign ddr_0_araddr_sync = {{30{1'b0}}, io_slave_0_araddr_sync};

    assign ddr_1_awaddr_sync = {{30{1'b0}}, io_slave_1_awaddr_sync};
    assign ddr_1_araddr_sync = {{30{1'b0}}, io_slave_1_araddr_sync};

    assign ddr_2_awaddr_sync = {{30{1'b0}}, io_slave_2_awaddr_sync};
    assign ddr_2_araddr_sync = {{30{1'b0}}, io_slave_2_araddr_sync};

    assign ddr_3_awaddr_sync = {{30{1'b0}}, io_slave_3_awaddr_sync};
    assign ddr_3_araddr_sync = {{30{1'b0}}, io_slave_3_araddr_sync};

endmodule

