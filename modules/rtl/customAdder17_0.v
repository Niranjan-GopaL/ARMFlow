
module customAdder17_0(
    input [16 : 0] A,
    input [16 : 0] B,
    output [17 : 0] Sum
);

    /*unsignedRippleCarryAdder17bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
