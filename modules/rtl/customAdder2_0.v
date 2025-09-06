
module customAdder2_0(
    input [1 : 0] A,
    input [1 : 0] B,
    output [2 : 0] Sum
);

    /*unsignedRippleCarryAdder2bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
