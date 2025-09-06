
module multiplier32bit_45(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [30:0] A_L, B_L;
    
    assign A_H = A[31:31];
    assign B_H = B[31:31];
    assign A_L = A[30:0];
    assign B_L = B[30:0];
    
    
    wire [0:0] P1;
    wire [30:0] P2, P3;
    wire [61:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_31 M2(A_H, B_L, P2);
    NR_31_1 M3(A_L, B_H, P3);
    NR_31_31 M4(A_L, B_L, P4);
    
    wire[30:0] P4_L;
    wire[30:0] P4_H;

    wire[31:0] operand1;
    wire[31:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[30:0];
    assign P4_H = P4[61:31];
    assign operand1 = {P1,P4_H};

    customAdder31_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
endmodule
        