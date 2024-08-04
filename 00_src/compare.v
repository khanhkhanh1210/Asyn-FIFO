module compare #(parameter PTR_WIDTH=3)
(
    input wire [PTR_WIDTH:0] a,b,
    output reg flag
);
    assign flag = (a == b);
endmodule

