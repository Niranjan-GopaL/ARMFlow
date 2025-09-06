
module customAdder6_0(
    input [5 : 0] A,
    input [5 : 0] B,
    output [6 : 0] Sum
);

    /*unsignedRippleCarryAdder6bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
