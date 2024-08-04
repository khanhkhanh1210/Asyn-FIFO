module fifo_mem #(parameter DEPTH=1024, DATA_WIDTH=8, PTR_WIDTH=10)
(
    input wire wclk, w_en, rclk, r_en,
    input wire  [PTR_WIDTH-1:0]  waddr, raddr,
    input wire  [DATA_WIDTH-1:0]  wdata,
    input wire full, empty,
    output wire [DATA_WIDTH-1:0]  rdata
);
    
    sky130_sram_1kbyte_1rw1r_8x1024_8 RAM(
                // Port 0: RW
                .clk0(wclk),
                .csb0(full),
                .web0(1'b0),
                .wmask0(w_en),
                .addr0(waddr[9:0]),
                .din0(wdata),
                // Port 1: R
                .clk1(rclk),
                .csb1(r_en),
                .addr1(raddr[9:0]),
                .dout1(rdata)
                //.dout1()
    );

endmodule
