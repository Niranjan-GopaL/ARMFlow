
module customAdder14_0(
    input [13 : 0] A,
    input [13 : 0] B,
    output [14 : 0] Sum
);

    /*unsignedRippleCarryAdder14bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
