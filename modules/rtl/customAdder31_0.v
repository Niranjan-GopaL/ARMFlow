
module customAdder31_0(
    input [30 : 0] A,
    input [30 : 0] B,
    output [31 : 0] Sum
);

    /*unsignedRippleCarryAdder31bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
