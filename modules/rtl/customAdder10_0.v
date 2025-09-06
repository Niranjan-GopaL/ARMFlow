
module customAdder10_0(
    input [9 : 0] A,
    input [9 : 0] B,
    output [10 : 0] Sum
);

    /*unsignedRippleCarryAdder10bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
