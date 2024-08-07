module tb_adder_11bit;
    // Inputs
    logic [10:0] A;
    logic [10:0] B;

    // Outputs
    logic [11:0] Sum;

    // Instantiate the Unit Under Test (UUT)
    ksa_adder uut (
        .a(A), 
        .b(B), 
        .sum(Sum[10:0]),
	.cout(Sum[11])
    );

    initial begin
        // Initialize Inputs
        A = 11'd0;
        B = 11'd0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        A = 11'd123;
        B = 11'd456;
        #10;
        $display("A = %d, B = %d, Sum = %d", A, B, Sum);

        A = 11'd1023;
        B = 11'd1023;
        #10;
        $display("A = %d, B = %d, Sum = %d", A, B, Sum);

        A = 11'd2047;
        B = 11'd2047;
        #10;
        $display("A = %d, B = %d, Sum = %d", A, B, Sum);

        A = 11'd500;
        B = 11'd1500;
        #10;
        $display("A = %d, B = %d, Sum = %d", A, B, Sum);

        // Add more test vectors as needed

        // Finish the simulation
        #50;
        $stop;
    end
      
endmodule

