
module multiplier32bit_32(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[31:28];
    assign B_H = B[31:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    
    wire [7:0] P1;
    wire [31:0] P2, P3;
    wire [55:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_28 M2(A_H, B_L, P2);
    NR_28_4 M3(A_L, B_H, P3);
    NR_28_28 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[35:0] operand1;
    wire[32:0] operand2;
    wire[36:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder36_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[35:0],P4_L};
endmodule
        