
module customAdder29_0(
    input [28 : 0] A,
    input [28 : 0] B,
    output [29 : 0] Sum
);

    /*unsignedRippleCarryAdder29bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
