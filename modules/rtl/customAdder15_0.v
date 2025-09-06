
module customAdder15_0(
    input [14 : 0] A,
    input [14 : 0] B,
    output [15 : 0] Sum
);

    /*unsignedRippleCarryAdder15bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
