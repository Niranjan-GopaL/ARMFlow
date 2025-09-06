
module multiplier32bit_35(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [25:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[31:6];
    assign B_H = B[31:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    
    wire [51:0] P1;
    wire [31:0] P2, P3;
    wire [11:0] P4;
    
    NR_26_26 M1(A_H, B_H, P1);
    NR_26_6 M2(A_H, B_L, P2);
    NR_6_26 M3(A_L, B_H, P3);
    NR_6_6 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[57:0] operand1;
    wire[32:0] operand2;
    wire[58:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder58_25 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[57:0],P4_L};
endmodule
        