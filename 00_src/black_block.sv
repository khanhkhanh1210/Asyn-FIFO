module pg_block(
	input logic a,b,
	output logic p,g
);
always_comb begin
	g = a & b;
	p = a ^ b;
end
endmodule

module fco_block(
	input logic pi,pi_pre,gi,gi_pre,
	output logic p_out, g_out
);
always_comb begin
	p_out = pi&pi_pre;
	g_out = (pi&gi_pre)|gi;
end
endmodule

module sum_block(
	input logic pi, ci_pre,
	output logic sum
);
always_comb begin
	sum = pi^ci_pre;
end
endmodule
