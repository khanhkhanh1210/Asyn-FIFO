
// Generated by Cadence Genus(TM) Synthesis Solution GENUS15.20 - 15.20-p004_1
// Generated on: Aug  4 2024 07:09:58

// Verification Directory fv/asynchronous_fifo 

module fifo_mem(wclk, w_en, rclk, r_en, waddr, raddr, wdata, full,
     empty, rdata);
  input wclk, w_en, rclk, r_en, full, empty;
  input [9:0] waddr, raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  wire wclk, w_en, rclk, r_en, full, empty;
  wire [9:0] waddr, raddr;
  wire [7:0] wdata;
  wire [7:0] rdata;
  wire UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2,
       UNCONNECTED3, UNCONNECTED4, UNCONNECTED5, UNCONNECTED6;
  sky130_sram_1kbyte_1rw1r_8x1024_8 RAM(.din0 (wdata), .addr0 (waddr),
       .wmask0 (w_en), .csb0 (full), .web0 (1'b0), .clk0 (wclk), .addr1
       (raddr), .csb1 (r_en), .clk1 (rclk), .dout0 ({UNCONNECTED6,
       UNCONNECTED5, UNCONNECTED4, UNCONNECTED3, UNCONNECTED2,
       UNCONNECTED1, UNCONNECTED0, UNCONNECTED}), .dout1 (rdata));
endmodule

module fco_block(pi, pi_pre, gi, gi_pre, p_out, g_out);
  input pi, pi_pre, gi, gi_pre;
  output p_out, g_out;
  wire pi, pi_pre, gi, gi_pre;
  wire p_out, g_out;
  wire n_4;
  and g1 (p_out, pi, pi_pre);
  and g2 (n_4, pi, gi_pre);
  or g3 (g_out, n_4, gi);
endmodule

module pg_block(a, b, p, g);
  input a, b;
  output p, g;
  wire a, b;
  wire p, g;
  and g1 (g, a, b);
  xor g2 (p, a, b);
endmodule

module sum_block(pi, ci_pre, sum);
  input pi, ci_pre;
  output sum;
  wire pi, ci_pre;
  wire sum;
  xor g1 (sum, pi, ci_pre);
endmodule

module ksa_adder_data_size10(a, b, cin, sum, cout);
  input [9:0] a, b;
  input cin;
  output [9:0] sum;
  output cout;
  wire [9:0] a, b;
  wire cin;
  wire [9:0] sum;
  wire cout;
  wire [9:0] p_pre;
  wire [9:0] g_pre;
  wire UNCONNECTED7, UNCONNECTED8, UNCONNECTED9, UNCONNECTED10,
       UNCONNECTED11, UNCONNECTED12, UNCONNECTED13, g_c;
  wire g_c_2, g_c_23, g_c_24, g_c_26, g_c_28, g_c_30, g_c_32, g_c_34;
  wire g_c_38, g_c_39, g_c_40, g_c_41, g_c_42, g_c_43, p_c, p_c_21;
  wire p_c_22, p_c_25, p_c_27, p_c_29, p_c_31, p_c_33;
  assign cout = 1'b0;
  fco_block \fco_1[1].gen_carry (p_pre[1], p_pre[0], g_pre[1],
       g_pre[0], p_c_22, g_c_24);
  fco_block \fco_1[2].gen_carry (p_pre[2], p_pre[1], g_pre[2],
       g_pre[1], p_c, g_c);
  fco_block \fco_1[3].gen_carry (p_pre[3], p_pre[2], g_pre[3],
       g_pre[2], p_c_21, g_c_23);
  fco_block \fco_1[4].gen_carry (p_pre[4], p_pre[3], g_pre[4],
       g_pre[3], p_c_25, g_c_26);
  fco_block \fco_1[5].gen_carry (p_pre[5], p_pre[4], g_pre[5],
       g_pre[4], p_c_27, g_c_28);
  fco_block \fco_1[6].gen_carry (p_pre[6], p_pre[5], g_pre[6],
       g_pre[5], p_c_29, g_c_30);
  fco_block \fco_1[7].gen_carry (p_pre[7], p_pre[6], g_pre[7],
       g_pre[6], p_c_31, g_c_32);
  fco_block \fco_1[8].gen_carry (p_pre[8], p_pre[7], g_pre[8],
       g_pre[7], p_c_33, g_c_34);
  fco_block \fco_2[2].gen_carry_2 (p_c, p_pre[0], g_c, g_pre[0],
       UNCONNECTED7, g_c_2);
  fco_block \fco_2[3].gen_carry_2 (p_c_21, p_c_22, g_c_23, g_c_24,
       UNCONNECTED8, g_c_38);
  fco_block \fco_2[4].gen_carry_2 (p_c_25, p_c, g_c_26, g_c,
       UNCONNECTED9, g_c_39);
  fco_block \fco_2[5].gen_carry_2 (p_c_27, p_c_21, g_c_28, g_c_23,
       UNCONNECTED10, g_c_40);
  fco_block \fco_2[6].gen_carry_2 (p_c_29, p_c_25, g_c_30, g_c_26,
       UNCONNECTED11, g_c_41);
  fco_block \fco_2[7].gen_carry_2 (p_c_31, p_c_27, g_c_32, g_c_28,
       UNCONNECTED12, g_c_42);
  fco_block \fco_2[8].gen_carry_2 (p_c_33, p_c_29, g_c_34, g_c_30,
       UNCONNECTED13, g_c_43);
  pg_block \pcc[0].pre_pros (a[0], b[0], p_pre[0], g_pre[0]);
  pg_block \pcc[1].pre_pros (a[1], b[1], p_pre[1], g_pre[1]);
  pg_block \pcc[2].pre_pros (a[2], b[2], p_pre[2], g_pre[2]);
  pg_block \pcc[3].pre_pros (a[3], b[3], p_pre[3], g_pre[3]);
  pg_block \pcc[4].pre_pros (a[4], b[4], p_pre[4], g_pre[4]);
  pg_block \pcc[5].pre_pros (a[5], b[5], p_pre[5], g_pre[5]);
  pg_block \pcc[6].pre_pros (a[6], b[6], p_pre[6], g_pre[6]);
  pg_block \pcc[7].pre_pros (a[7], b[7], p_pre[7], g_pre[7]);
  pg_block \pcc[8].pre_pros (a[8], b[8], p_pre[8], g_pre[8]);
  pg_block \pcc[9].pre_pros (a[9], b[9], p_pre[9], g_pre[9]);
  sum_block sum_0(p_pre[0], cin, sum[0]);
  sum_block \sum_gen[1].sum (p_pre[1], g_pre[0], sum[1]);
  sum_block \sum_gen[2].sum (p_pre[2], g_c_24, sum[2]);
  sum_block \sum_gen[3].sum (p_pre[3], g_c_2, sum[3]);
  sum_block \sum_gen[4].sum (p_pre[4], g_c_38, sum[4]);
  sum_block \sum_gen[5].sum (p_pre[5], g_c_39, sum[5]);
  sum_block \sum_gen[6].sum (p_pre[6], g_c_40, sum[6]);
  sum_block \sum_gen[7].sum (p_pre[7], g_c_41, sum[7]);
  sum_block \sum_gen[8].sum (p_pre[8], g_c_42, sum[8]);
  sum_block \sum_gen[9].sum (p_pre[9], g_c_43, sum[9]);
endmodule

module rptr_handler_PTR_WIDTH10(rclk, rrst_n, r_en, g_wptr_sync,
     b_rptr, g_rptr, empty);
  input rclk, rrst_n, r_en;
  input [10:0] g_wptr_sync;
  output [10:0] b_rptr, g_rptr;
  output empty;
  wire rclk, rrst_n, r_en;
  wire [10:0] g_wptr_sync;
  wire [10:0] b_rptr, g_rptr;
  wire empty;
  wire [10:0] b_rptr_next;
  wire [10:0] g_rptr_next;
  wire UNCONNECTED14, UNCONNECTED15, n_25, n_36, n_39, n_134, n_135,
       n_136;
  wire n_137, n_138, n_139, n_140, n_141, n_142, n_143, n_144;
  wire n_145, n_146, n_147, rempty;
  assign b_rptr[10] = 1'b0;
  ksa_adder_data_size10 adder(.a (b_rptr[9:0]), .b ({9'b000000000,
       n_36}), .cin (UNCONNECTED14), .sum (b_rptr_next[9:0]), .cout
       (UNCONNECTED15));
  CDN_flop \b_rptr_reg[0] (.clk (rclk), .d (b_rptr_next[0]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[0]));
  CDN_flop \b_rptr_reg[1] (.clk (rclk), .d (b_rptr_next[1]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[1]));
  CDN_flop \b_rptr_reg[2] (.clk (rclk), .d (b_rptr_next[2]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[2]));
  CDN_flop \b_rptr_reg[3] (.clk (rclk), .d (b_rptr_next[3]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[3]));
  CDN_flop \b_rptr_reg[4] (.clk (rclk), .d (b_rptr_next[4]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[4]));
  CDN_flop \b_rptr_reg[5] (.clk (rclk), .d (b_rptr_next[5]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[5]));
  CDN_flop \b_rptr_reg[6] (.clk (rclk), .d (b_rptr_next[6]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[6]));
  CDN_flop \b_rptr_reg[7] (.clk (rclk), .d (b_rptr_next[7]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[7]));
  CDN_flop \b_rptr_reg[8] (.clk (rclk), .d (b_rptr_next[8]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[8]));
  CDN_flop \b_rptr_reg[9] (.clk (rclk), .d (b_rptr_next[9]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_rptr[9]));
  CDN_flop empty_reg(.clk (rclk), .d (rempty), .sena (1'b1), .aclr
       (1'b0), .apre (n_25), .srl (1'b0), .srd (1'b0), .q (empty));
  not g1 (n_39, empty);
  xor g10 (g_rptr_next[9], b_rptr_next[10], b_rptr_next[9]);
  xnor g11 (n_144, g_wptr_sync[10], b_rptr_next[10]);
  nand g12 (n_145, n_134, n_135, n_136, n_137);
  nand g13 (n_146, n_138, n_139, n_140, n_141);
  nand g14 (n_147, n_142, n_143, n_144);
  nor g15 (rempty, n_145, n_146, n_147);
  xor g19 (g_rptr_next[0], b_rptr_next[1], b_rptr_next[0]);
  and g2 (n_36, r_en, n_39);
  xor g20 (g_rptr_next[1], b_rptr_next[2], b_rptr_next[1]);
  xor g21 (g_rptr_next[3], b_rptr_next[4], b_rptr_next[3]);
  xor g22 (g_rptr_next[4], b_rptr_next[5], b_rptr_next[4]);
  xor g23 (g_rptr_next[5], b_rptr_next[6], b_rptr_next[5]);
  xor g24 (g_rptr_next[6], b_rptr_next[7], b_rptr_next[6]);
  not g25 (n_25, rrst_n);
  xnor g26 (n_134, g_wptr_sync[0], g_rptr_next[0]);
  xnor g27 (n_143, g_wptr_sync[9], g_rptr_next[9]);
  xnor g28 (n_135, g_wptr_sync[1], g_rptr_next[1]);
  xnor g29 (n_136, g_wptr_sync[2], g_rptr_next[2]);
  xor g3 (g_rptr_next[2], b_rptr_next[3], b_rptr_next[2]);
  xnor g30 (n_141, g_wptr_sync[7], g_rptr_next[7]);
  xnor g31 (n_142, g_wptr_sync[8], g_rptr_next[8]);
  xnor g4 (n_137, g_wptr_sync[3], g_rptr_next[3]);
  xnor g5 (n_138, g_wptr_sync[4], g_rptr_next[4]);
  xnor g6 (n_139, g_wptr_sync[5], g_rptr_next[5]);
  xnor g7 (n_140, g_wptr_sync[6], g_rptr_next[6]);
  xor g8 (g_rptr_next[7], b_rptr_next[8], b_rptr_next[7]);
  xor g9 (g_rptr_next[8], b_rptr_next[9], b_rptr_next[8]);
  CDN_flop \g_rptr_reg[0] (.clk (rclk), .d (g_rptr_next[0]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[0]));
  CDN_flop \g_rptr_reg[10] (.clk (rclk), .d (b_rptr_next[10]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[10]));
  CDN_flop \g_rptr_reg[1] (.clk (rclk), .d (g_rptr_next[1]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[1]));
  CDN_flop \g_rptr_reg[2] (.clk (rclk), .d (g_rptr_next[2]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[2]));
  CDN_flop \g_rptr_reg[3] (.clk (rclk), .d (g_rptr_next[3]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[3]));
  CDN_flop \g_rptr_reg[4] (.clk (rclk), .d (g_rptr_next[4]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[4]));
  CDN_flop \g_rptr_reg[5] (.clk (rclk), .d (g_rptr_next[5]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[5]));
  CDN_flop \g_rptr_reg[6] (.clk (rclk), .d (g_rptr_next[6]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[6]));
  CDN_flop \g_rptr_reg[7] (.clk (rclk), .d (g_rptr_next[7]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[7]));
  CDN_flop \g_rptr_reg[8] (.clk (rclk), .d (g_rptr_next[8]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[8]));
  CDN_flop \g_rptr_reg[9] (.clk (rclk), .d (g_rptr_next[9]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_rptr[9]));
endmodule

module synchronizer_WIDTH10(clk, rst_n, d_in, d_out);
  input clk, rst_n;
  input [10:0] d_in;
  output [10:0] d_out;
  wire clk, rst_n;
  wire [10:0] d_in;
  wire [10:0] d_out;
  wire [10:0] q1;
  wire n_23;
  CDN_flop \d_out_reg[0] (.clk (clk), .d (q1[0]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[0]));
  CDN_flop \d_out_reg[10] (.clk (clk), .d (q1[10]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[10]));
  CDN_flop \d_out_reg[1] (.clk (clk), .d (q1[1]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[1]));
  CDN_flop \d_out_reg[2] (.clk (clk), .d (q1[2]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[2]));
  CDN_flop \d_out_reg[3] (.clk (clk), .d (q1[3]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[3]));
  CDN_flop \d_out_reg[4] (.clk (clk), .d (q1[4]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[4]));
  CDN_flop \d_out_reg[5] (.clk (clk), .d (q1[5]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[5]));
  CDN_flop \d_out_reg[6] (.clk (clk), .d (q1[6]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[6]));
  CDN_flop \d_out_reg[7] (.clk (clk), .d (q1[7]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[7]));
  CDN_flop \d_out_reg[8] (.clk (clk), .d (q1[8]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[8]));
  CDN_flop \d_out_reg[9] (.clk (clk), .d (q1[9]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (d_out[9]));
  not g1 (n_23, rst_n);
  CDN_flop \q1_reg[0] (.clk (clk), .d (d_in[0]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[0]));
  CDN_flop \q1_reg[10] (.clk (clk), .d (d_in[10]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[10]));
  CDN_flop \q1_reg[1] (.clk (clk), .d (d_in[1]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[1]));
  CDN_flop \q1_reg[2] (.clk (clk), .d (d_in[2]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[2]));
  CDN_flop \q1_reg[3] (.clk (clk), .d (d_in[3]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[3]));
  CDN_flop \q1_reg[4] (.clk (clk), .d (d_in[4]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[4]));
  CDN_flop \q1_reg[5] (.clk (clk), .d (d_in[5]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[5]));
  CDN_flop \q1_reg[6] (.clk (clk), .d (d_in[6]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[6]));
  CDN_flop \q1_reg[7] (.clk (clk), .d (d_in[7]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[7]));
  CDN_flop \q1_reg[8] (.clk (clk), .d (d_in[8]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[8]));
  CDN_flop \q1_reg[9] (.clk (clk), .d (d_in[9]), .sena (1'b1), .aclr
       (1'b0), .apre (1'b0), .srl (n_23), .srd (1'b0), .q (q1[9]));
endmodule

module wptr_handler_PTR_WIDTH10(wclk, wrst_n, w_en, g_rptr_sync,
     b_wptr, g_wptr, full);
  input wclk, wrst_n, w_en;
  input [10:0] g_rptr_sync;
  output [10:0] b_wptr, g_wptr;
  output full;
  wire wclk, wrst_n, w_en;
  wire [10:0] g_rptr_sync;
  wire [10:0] b_wptr, g_wptr;
  wire full;
  wire [10:0] b_wptr_next;
  wire [10:0] g_wptr_next;
  wire UNCONNECTED16, UNCONNECTED17, n_25, n_36, n_39, n_136, n_137,
       n_138;
  wire n_139, n_140, n_141, n_142, n_143, n_144, n_145, n_146;
  wire n_147, n_148, n_149, wfull;
  assign b_wptr[10] = 1'b0;
  ksa_adder_data_size10 adder(.a (b_wptr[9:0]), .b ({9'b000000000,
       n_36}), .cin (UNCONNECTED16), .sum (b_wptr_next[9:0]), .cout
       (UNCONNECTED17));
  CDN_flop \b_wptr_reg[0] (.clk (wclk), .d (b_wptr_next[0]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[0]));
  CDN_flop \b_wptr_reg[1] (.clk (wclk), .d (b_wptr_next[1]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[1]));
  CDN_flop \b_wptr_reg[2] (.clk (wclk), .d (b_wptr_next[2]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[2]));
  CDN_flop \b_wptr_reg[3] (.clk (wclk), .d (b_wptr_next[3]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[3]));
  CDN_flop \b_wptr_reg[4] (.clk (wclk), .d (b_wptr_next[4]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[4]));
  CDN_flop \b_wptr_reg[5] (.clk (wclk), .d (b_wptr_next[5]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[5]));
  CDN_flop \b_wptr_reg[6] (.clk (wclk), .d (b_wptr_next[6]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[6]));
  CDN_flop \b_wptr_reg[7] (.clk (wclk), .d (b_wptr_next[7]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[7]));
  CDN_flop \b_wptr_reg[8] (.clk (wclk), .d (b_wptr_next[8]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[8]));
  CDN_flop \b_wptr_reg[9] (.clk (wclk), .d (b_wptr_next[9]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (b_wptr[9]));
  CDN_flop full_reg(.clk (wclk), .d (wfull), .sena (1'b1), .aclr
       (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q (full));
  not g1 (n_39, full);
  xor g10 (g_wptr_next[9], b_wptr_next[10], b_wptr_next[9]);
  nand g12 (n_147, n_136, n_137, n_138, n_139);
  nand g13 (n_148, n_140, n_141, n_142, n_143);
  nand g14 (n_149, n_144, n_145, n_146);
  nor g15 (wfull, n_147, n_148, n_149);
  and g2 (n_36, w_en, n_39);
  xor g20 (g_wptr_next[0], b_wptr_next[1], b_wptr_next[0]);
  xor g21 (g_wptr_next[1], b_wptr_next[2], b_wptr_next[1]);
  xor g22 (g_wptr_next[3], b_wptr_next[4], b_wptr_next[3]);
  xor g23 (g_wptr_next[4], b_wptr_next[5], b_wptr_next[4]);
  xor g24 (g_wptr_next[5], b_wptr_next[6], b_wptr_next[5]);
  xor g25 (g_wptr_next[6], b_wptr_next[7], b_wptr_next[6]);
  xor g26 (g_wptr_next[7], b_wptr_next[8], b_wptr_next[7]);
  not g27 (n_25, wrst_n);
  xor g3 (g_wptr_next[2], b_wptr_next[3], b_wptr_next[2]);
  xnor g30 (n_136, g_wptr_next[0], g_rptr_sync[0]);
  xnor g32 (n_137, g_wptr_next[1], g_rptr_sync[1]);
  xnor g33 (n_138, g_wptr_next[2], g_rptr_sync[2]);
  xnor g34 (n_144, g_wptr_next[8], g_rptr_sync[8]);
  xor g35 (n_145, g_wptr_next[9], g_rptr_sync[9]);
  xor g36 (n_146, b_wptr_next[10], g_rptr_sync[10]);
  xnor g4 (n_139, g_wptr_next[3], g_rptr_sync[3]);
  xnor g5 (n_140, g_wptr_next[4], g_rptr_sync[4]);
  xnor g6 (n_141, g_wptr_next[5], g_rptr_sync[5]);
  xnor g7 (n_142, g_wptr_next[6], g_rptr_sync[6]);
  xnor g8 (n_143, g_wptr_next[7], g_rptr_sync[7]);
  xor g9 (g_wptr_next[8], b_wptr_next[9], b_wptr_next[8]);
  CDN_flop \g_wptr_reg[0] (.clk (wclk), .d (g_wptr_next[0]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[0]));
  CDN_flop \g_wptr_reg[10] (.clk (wclk), .d (b_wptr_next[10]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[10]));
  CDN_flop \g_wptr_reg[1] (.clk (wclk), .d (g_wptr_next[1]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[1]));
  CDN_flop \g_wptr_reg[2] (.clk (wclk), .d (g_wptr_next[2]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[2]));
  CDN_flop \g_wptr_reg[3] (.clk (wclk), .d (g_wptr_next[3]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[3]));
  CDN_flop \g_wptr_reg[4] (.clk (wclk), .d (g_wptr_next[4]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[4]));
  CDN_flop \g_wptr_reg[5] (.clk (wclk), .d (g_wptr_next[5]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[5]));
  CDN_flop \g_wptr_reg[6] (.clk (wclk), .d (g_wptr_next[6]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[6]));
  CDN_flop \g_wptr_reg[7] (.clk (wclk), .d (g_wptr_next[7]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[7]));
  CDN_flop \g_wptr_reg[8] (.clk (wclk), .d (g_wptr_next[8]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[8]));
  CDN_flop \g_wptr_reg[9] (.clk (wclk), .d (g_wptr_next[9]), .sena
       (1'b1), .aclr (n_25), .apre (1'b0), .srl (1'b0), .srd (1'b0), .q
       (g_wptr[9]));
endmodule

module asynchronous_fifo(wclk, wrst_n, rclk, rrst_n, w_en, r_en,
     data_in, data_out, full, empty);
  input wclk, wrst_n, rclk, rrst_n, w_en, r_en;
  input [7:0] data_in;
  output [7:0] data_out;
  output full, empty;
  wire wclk, wrst_n, rclk, rrst_n, w_en, r_en;
  wire [7:0] data_in;
  wire [7:0] data_out;
  wire full, empty;
  wire [10:0] b_wptr;
  wire [10:0] b_rptr;
  wire [10:0] g_wptr_sync;
  wire [10:0] g_rptr;
  wire [10:0] g_rptr_sync;
  wire [10:0] g_wptr;
  fifo_mem fifom(wclk, w_en, rclk, r_en, b_wptr[9:0], b_rptr[9:0],
       data_in, full, 1'b0, data_out);
  rptr_handler_PTR_WIDTH10 rptr_h(rclk, rrst_n, r_en, g_wptr_sync,
       b_rptr, g_rptr, empty);
  synchronizer_WIDTH10 sync_rptr(wclk, wrst_n, g_rptr, g_rptr_sync);
  synchronizer_WIDTH10 sync_wptr(rclk, rrst_n, g_wptr, g_wptr_sync);
  wptr_handler_PTR_WIDTH10 wptr_h(wclk, wrst_n, w_en, g_rptr_sync,
       b_wptr, g_wptr, full);
endmodule

`ifdef RC_CDN_GENERIC_GATE
`else
module CDN_flop(clk, d, sena, aclr, apre, srl, srd, q);
  input clk, d, sena, aclr, apre, srl, srd;
  output q;
  wire clk, d, sena, aclr, apre, srl, srd;
  wire q;
  reg  qi;
  assign #1 q = qi;
  always 
    @(posedge clk or posedge apre or posedge aclr) 
      if (aclr) 
        qi <= 0;
      else if (apre) 
          qi <= 1;
        else if (srl) 
            qi <= srd;
          else begin
            if (sena) 
              qi <= d;
          end
  initial 
    qi <= 1'b0;
endmodule
`endif