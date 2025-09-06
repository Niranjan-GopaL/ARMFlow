module XOR(
    input A,B,
    output Y
);
    assign Y = A ^ B;
endmodule

module XNOR(
    input A,B,
    output Y
);
    assign Y = ~(A ^ B);
endmodule

module BUF(
    input A,
    output Y
);
    assign Y = A;
endmodule

module NOT(
    input A,
    output Y
);
    assign Y = ~A;
endmodule

module AND(
    input A,B,
    output Y
);
    assign Y = A & B;
endmodule

module NAND(
    input A,B,
    output Y
);
    assign Y = ~(A & B);
endmodule

module OR(
    input A,B,
    output Y
);
    assign Y = A | B;
endmodule

module NOR(
    input A,B,
    output Y
);
    assign Y = ~(A | B);
endmodule
