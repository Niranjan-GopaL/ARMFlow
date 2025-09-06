
module multiplier32bit_8(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [24:0] A_L, B_L;
    
    assign A_H = A[31:25];
    assign B_H = B[31:25];
    assign A_L = A[24:0];
    assign B_L = B[24:0];
    
    
    wire [13:0] P1;
    wire [31:0] P2, P3;
    wire [49:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_25 M2(A_H, B_L, P2);
    NR_25_7 M3(A_L, B_H, P3);
    NR_25_25 M4(A_L, B_L, P4);
    
    wire[24:0] P4_L;
    wire[24:0] P4_H;

    wire[38:0] operand1;
    wire[32:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[24:0];
    assign P4_H = P4[49:25];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        