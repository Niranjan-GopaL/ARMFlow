
module customAdder24_0(
    input [23 : 0] A,
    input [23 : 0] B,
    output [24 : 0] Sum
);

    /*unsignedRippleCarryAdder24bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
