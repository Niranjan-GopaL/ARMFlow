
module customAdder25_0(
    input [24 : 0] A,
    input [24 : 0] B,
    output [25 : 0] Sum
);

    /*unsignedRippleCarryAdder25bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
