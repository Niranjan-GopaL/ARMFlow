
module customAdder8_0(
    input [7 : 0] A,
    input [7 : 0] B,
    output [8 : 0] Sum
);

    /*unsignedRippleCarryAdder8bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
