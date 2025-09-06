
module customAdder23_0(
    input [22 : 0] A,
    input [22 : 0] B,
    output [23 : 0] Sum
);

    /*unsignedRippleCarryAdder23bit adder_module(
        A,
        B,
        Sum
    );*/
    assign Sum = A + B;

endmodule
