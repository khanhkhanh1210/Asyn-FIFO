module cka_adder #(parameter data_width = 8)
(
    input wire [data_width-1:0] a, b,
    output reg [data_width-1:0] sum
);

