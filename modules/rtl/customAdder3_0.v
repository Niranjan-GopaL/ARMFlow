
module customAdder3_0(
    input [2 : 0] A,
    input [2 : 0] B,
    output [3 : 0] Sum
);

    /*unsignedRippleCarryAdder3bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
