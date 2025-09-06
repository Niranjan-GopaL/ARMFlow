
module customAdder11_0(
    input [10 : 0] A,
    input [10 : 0] B,
    output [11 : 0] Sum
);

    /*unsignedRippleCarryAdder11bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
