
module customAdder22_0(
    input [21 : 0] A,
    input [21 : 0] B,
    output [22 : 0] Sum
);

    /*unsignedRippleCarryAdder22bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
