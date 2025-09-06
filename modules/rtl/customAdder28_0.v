
module customAdder28_0(
    input [27 : 0] A,
    input [27 : 0] B,
    output [28 : 0] Sum
);

    /*unsignedRippleCarryAdder28bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
