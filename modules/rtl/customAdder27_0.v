
module customAdder27_0(
    input [26 : 0] A,
    input [26 : 0] B,
    output [27 : 0] Sum
);

    /*unsignedRippleCarryAdder27bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
