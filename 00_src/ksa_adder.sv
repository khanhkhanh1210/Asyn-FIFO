module ksa_adder #(parameter
	data_size=3
)
(
	input logic [data_size-1:0] a,b,		//input 8 bit
	input logic cin,
	output logic [data_size-1:0] sum,	//output 8 bit
	output logic cout			//overflow bit
);
	logic [data_size-1:0]  p_pre, g_pre, p_c, g_c, p_c_2, g_c_2;
	
	always_comb begin:fco_1_state
		p_c[0] = p_pre[0];
		g_c[0] = g_pre[0];
		p_c_2[0] = p_pre[0];
		g_c_2[0] = g_pre[0];	
	end

	always_comb begin:fco_2_state
		p_c_2[1] = p_c[1];
		g_c_2[1] = g_c[1];	
	end

	genvar i;
	generate
	
//pre-processing state		
		for(i = 0; i < data_size; i++) begin: pcc
			pg_block pre_pros(a[i], b[i], p_pre[i], g_pre[i]);
		end

// first fco state
		for(i = 1; i < data_size; i++) begin:fco_1
			fco_block gen_carry(p_pre[i], p_pre[i-1], g_pre[i], g_pre[i-1], p_c[i], g_c[i]);
		end

// 2nd fco state
		for(i = 2; i < data_size; i++) begin:fco_2
			fco_block gen_carry_2(p_c[i], p_c[i-2], g_c[i], g_c[i-2], p_c_2[i], g_c_2[i]);
		end

//result state
		sum_block sum_0(p_pre[0], cin, sum[0]);
	
		for(i = 1; i < data_size; i++) begin:sum_gen
			sum_block sum(p_pre[i], g_c_2[i-1], sum[i]);
		end

		assign	cout = g_c_2[data_size-1];
	endgenerate
endmodule
/*
module ripple_adder#(parameter
	data_size = 64
)
(		
	input logic [data_size-1:0] a,b,		//input 8 bit
	input logic cin,
	output logic [data_size-1:0] sum,	//output 8 bit
	output logic cout			//overflow bit
);
	logic [data_size-1:0] carry;
	genvar i;
	generate
		fulladder adder0(a[0],b[0],cin,sum[0],carry[0]);
		for(i = 1; i < data_size; i++) begin: create_adder
			fulladder adder(a[i],b[i],carry[i-1],sum[i],carry[i]);
		end
		assign	cout = carry[data_size-1];
	endgenerate
endmodule
*/
