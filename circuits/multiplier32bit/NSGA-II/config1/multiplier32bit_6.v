
module multiplier32bit_6(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [23:0] A_L, B_L;
    
    assign A_H = A[31:24];
    assign B_H = B[31:24];
    assign A_L = A[23:0];
    assign B_L = B[23:0];
    
    
    wire [15:0] P1;
    wire [31:0] P2, P3;
    wire [47:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_24 M2(A_H, B_L, P2);
    NR_24_8 M3(A_L, B_H, P3);
    NR_24_24 M4(A_L, B_L, P4);
    
    wire[23:0] P4_L;
    wire[23:0] P4_H;

    wire[39:0] operand1;
    wire[32:0] operand2;
    wire[40:0] out;
    
    assign P4_L = P4[23:0];
    assign P4_H = P4[47:24];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder40_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[39:0],P4_L};
endmodule
        