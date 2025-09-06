
module customAdder13_0(
    input [12 : 0] A,
    input [12 : 0] B,
    output [13 : 0] Sum
);

    /*unsignedRippleCarryAdder13bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
