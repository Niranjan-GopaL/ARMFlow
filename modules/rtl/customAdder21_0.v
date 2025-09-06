
module customAdder21_0(
    input [20 : 0] A,
    input [20 : 0] B,
    output [21 : 0] Sum
);

    /*unsignedRippleCarryAdder21bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
