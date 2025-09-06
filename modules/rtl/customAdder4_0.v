
module customAdder4_0(
    input [3 : 0] A,
    input [3 : 0] B,
    output [4 : 0] Sum
);

    /*unsignedRippleCarryAdder4bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
