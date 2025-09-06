
module customAdder9_0(
    input [8 : 0] A,
    input [8 : 0] B,
    output [9 : 0] Sum
);

    /*unsignedRippleCarryAdder9bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
