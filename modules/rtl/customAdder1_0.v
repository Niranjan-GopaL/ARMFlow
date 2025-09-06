
module customAdder1_0(
    input [0 : 0] A,
    input [0 : 0] B,
    output [1 : 0] Sum
);

    /*unsignedRippleCarryAdder1bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
