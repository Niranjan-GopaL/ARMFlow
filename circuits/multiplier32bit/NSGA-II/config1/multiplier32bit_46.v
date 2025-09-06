
module multiplier32bit_46(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [29:0] A_L, B_L;
    
    assign A_H = A[31:30];
    assign B_H = B[31:30];
    assign A_L = A[29:0];
    assign B_L = B[29:0];
    
    
    wire [3:0] P1;
    wire [31:0] P2, P3;
    wire [59:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_30 M2(A_H, B_L, P2);
    NR_30_2 M3(A_L, B_H, P3);
    NR_30_30 M4(A_L, B_L, P4);
    
    wire[29:0] P4_L;
    wire[29:0] P4_H;

    wire[33:0] operand1;
    wire[32:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[29:0];
    assign P4_H = P4[59:30];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        