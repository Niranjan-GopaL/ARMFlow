
module customAdder20_0(
    input [19 : 0] A,
    input [19 : 0] B,
    output [20 : 0] Sum
);

    /*unsignedRippleCarryAdder20bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
