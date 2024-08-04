/*module fifo_mem #(parameter DEPTH=8, DATA_WIDTH=8, PTR_WIDTH=3) (
  input wclk, w_en, rclk, r_en,
  input [PTR_WIDTH:0] b_wptr, b_rptr,
  input [DATA_WIDTH-1:0] data_in,
  input full, empty,
  output reg [DATA_WIDTH-1:0] data_out
);
  reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1];
  
  always@(posedge wclk) begin
    if(w_en & !full) begin
      fifo[b_wptr[PTR_WIDTH-1:0]] <= data_in;
    end
  end
  /*
  always@(posedge rclk) begin
    if(r_en & !empty) begin
      data_out <= fifo[b_rptr[PTR_WIDTH-1:0]];
    end
  end
  */
/*  assign data_out = fifo[b_rptr[PTR_WIDTH-1:0]];
endmodule
*/
module SRAM1K #(parameter DEPTH=1024, DATA_WIDTH=8, PTR_WIDTH=10)
(
    input wire wclk, w_en, rclk, r_en,
    input wire  [PTR_WIDTH-1:0]  raddr, waddr,
    input wire  [DATA_WIDTH-1:0]  wdata,
    output wire [DATA_WIDTH-1:0]  rdata,
    input  wire cs,
    input wire  [3:0]   wen
);
    
    parameter RAM_DEPTH = 1 << ADDR_WIDTH;
    // 8 x 1kbytes OpenRAM banks
    wire [RAM_DEPTH-1:0] sram_rdata[DATA_WIDTH-1:0];

    wire [7:0] rsram_dec = {
                            (raddr[9:7]=='d7),
                            (raddr[9:7]=='d6),
                            (raddr[9:7]=='d5),
                            (raddr[9:7]=='d4),
                            (raddr[9:7]=='d3),
                            (raddr[9:7]=='d2),
                            (raddr[9:7]=='d1),
                            (raddr[9:7]=='d0)
                        };

    wire [7:0] wsram_dec = {
                            (waddr[9:7]=='d7),
                            (waddr[9:7]=='d6),
                            (waddr[9:7]=='d5),
                            (waddr[9:7]=='d4),
                            (waddr[9:7]=='d3),
                            (waddr[9:7]=='d2),
                            (waddr[9:7]=='d1),
                            (waddr[9:7]=='d0)
                        };

    wire [7:0] sram_csb = ~({8{cs}} & sram_dec);

    reg [2:0] sram_sel;
/*    initial begin
		$readmemb("w_1_15.txt", sram_rdata);
    end
*/
    always @(posedge rclk)
        sram_sel <= raddr[9:7];
    always @(posedge wclk)
        sram_sel <= waddr[9:7];

    assign rdata = sram_rdata[sram_sel];

//    generate
//        genvar i;
//      for(i=0; i<8; i=i+1) begin : BANK
    sky130_sram_1kbyte_1rw1r_8x1024_8 RAM(
                // Port 0: RW
                .clk0(wclk),
                .csb0(1'b0),
                .web0(1'b0),
                .wmask0(w_en),
                .addr0(waddr[9:0]),
                .din0(wdata),
                // Port 1: R
                .clk1(rclk),
                .csb1(r_en),
                .addr1(raddr[9:0])
                .dout1(sram_rdata[i]),
                //.dout1()
            );
//        end
//    endgenerate

endmodule
