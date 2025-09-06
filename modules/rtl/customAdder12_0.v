
module customAdder12_0(
    input [11 : 0] A,
    input [11 : 0] B,
    output [12 : 0] Sum
);

    /*unsignedRippleCarryAdder12bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
