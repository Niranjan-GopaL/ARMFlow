
module multiplier32bit_4(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [28:0] A_L, B_L;
    
    assign A_H = A[31:29];
    assign B_H = B[31:29];
    assign A_L = A[28:0];
    assign B_L = B[28:0];
    
    
    wire [5:0] P1;
    wire [31:0] P2, P3;
    wire [57:0] P4;
    
    rr_3x3_1 M1(A_H, B_H, P1);
    NR_3_29 M2(A_H, B_L, P2);
    NR_29_3 M3(A_L, B_H, P3);
    NR_29_29 M4(A_L, B_L, P4);
    
    wire[28:0] P4_L;
    wire[28:0] P4_H;

    wire[34:0] operand1;
    wire[32:0] operand2;
    wire[35:0] out;
    
    assign P4_L = P4[28:0];
    assign P4_H = P4[57:29];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder35_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[34:0],P4_L};
endmodule
        
module rr_3x3_1(
    input [2:0] A, 
    input [2:0] B, 
    output [5:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[2:2];
    assign B_H = B[2:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [0:0] P1;
    wire [1:0] P2, P3;
    wire [3:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_2 M2(A_H, B_L, P2);
    NR_2_1 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[2:0] operand1;
    wire[2:0] operand2;
    wire[3:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder2_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder3_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[3:0],P4_L};
endmodule
        