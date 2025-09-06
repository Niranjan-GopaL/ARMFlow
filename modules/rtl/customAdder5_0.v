
module customAdder5_0(
    input [4 : 0] A,
    input [4 : 0] B,
    output [5 : 0] Sum
);

    /*unsignedRippleCarryAdder5bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
