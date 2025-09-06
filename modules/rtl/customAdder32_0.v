
module customAdder32_0(
    input [31 : 0] A,
    input [31 : 0] B,
    output [32 : 0] Sum
);

    /*unsignedRippleCarryAdder32bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
