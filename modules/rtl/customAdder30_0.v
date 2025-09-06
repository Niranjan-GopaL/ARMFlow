
module customAdder30_0(
    input [29 : 0] A,
    input [29 : 0] B,
    output [30 : 0] Sum
);

    /*unsignedRippleCarryAdder30bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
