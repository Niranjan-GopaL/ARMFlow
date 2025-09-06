
module customAdder26_0(
    input [25 : 0] A,
    input [25 : 0] B,
    output [26 : 0] Sum
);

    /*unsignedRippleCarryAdder26bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
