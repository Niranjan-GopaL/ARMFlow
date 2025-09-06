
module customAdder19_0(
    input [18 : 0] A,
    input [18 : 0] B,
    output [19 : 0] Sum
);

    /*unsignedRippleCarryAdder19bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
