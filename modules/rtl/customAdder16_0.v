
module customAdder16_0(
    input [15 : 0] A,
    input [15 : 0] B,
    output [16 : 0] Sum
);

    /*unsignedRippleCarryAdder16bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
