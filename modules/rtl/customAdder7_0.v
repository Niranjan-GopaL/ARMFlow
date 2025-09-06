
module customAdder7_0(
    input [6 : 0] A,
    input [6 : 0] B,
    output [7 : 0] Sum
);

    /*unsignedRippleCarryAdder7bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
