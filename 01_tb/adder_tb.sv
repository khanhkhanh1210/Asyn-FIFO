//`timescale 1ns/10ps

module testbench;
 logic [10:0] a, b;// Two 4-bit inputs
 logic cin;
 logic [10:0] result;
 logic carry;

ksa_adder alu(a, b, cin, result, carry);

  initial begin
    $shm_open("waves.shm"); 
    $shm_probe("AS");
  end
/*
  initial begin
     $sdf_annotate("synth_wrapper.sdf",alu);
  end
*/

initial begin 	
  #0 cin <= 1'b1;
  #0 a <= 0;
  #0 b <= 0;	
#200 $finish;
end

initial begin 
  forever #20 b <= $urandom_range(0, 1024);
end

initial begin 
  forever #20 cin <= $urandom_range(0, 1);
end
initial begin 	
  forever #20 a <= $urandom_range(0, 1024);
end

endmodule
