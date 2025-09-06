
module customAdder18_0(
    input [17 : 0] A,
    input [17 : 0] B,
    output [18 : 0] Sum
);

    /*unsignedRippleCarryAdder18bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
