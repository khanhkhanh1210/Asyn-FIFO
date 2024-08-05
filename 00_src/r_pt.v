module rptr_handler #(parameter PTR_WIDTH=3) (
  input rclk, rrst_n, r_en,
  input [PTR_WIDTH:0] g_wptr_sync,
  output reg [PTR_WIDTH:0] b_rptr, g_rptr,
  output reg empty
);

  reg [PTR_WIDTH:0] b_rptr_next;
  reg [PTR_WIDTH:0] g_rptr_next;

//if read not empty and r_en, increase read pointer
  ksa_adder #(PTR_WIDTH) adder(.a(b_rptr), .b(r_en & !empty), .cin(1'b0), .sum(b_rptr_next));
//  assign b_rptr_next = b_rptr+(r_en & !empty);


  assign g_rptr_next = (b_rptr_next >> 1)^b_rptr_next;

// read pointer = write pointer -> rempty
  assign rempty = (g_wptr_sync == g_rptr_next);
//  compare compareb(g_wptr_sync, g_rptr_next, rempty);

  always@(posedge rclk or negedge rrst_n) begin
    if(!rrst_n) begin
      b_rptr <= 0;
      g_rptr <= 0;
    end
    else begin
      b_rptr <= b_rptr_next;
      g_rptr <= g_rptr_next;
    end
  end
  
  always@(posedge rclk or negedge rrst_n) begin
    if(!rrst_n) empty <= 1;
    else        empty <= rempty;
  end
endmodule
