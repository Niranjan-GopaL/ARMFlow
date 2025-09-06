
module multiplier32bit_9(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [26:0] A_L, B_L;
    
    assign A_H = A[31:27];
    assign B_H = B[31:27];
    assign A_L = A[26:0];
    assign B_L = B[26:0];
    
    
    wire [9:0] P1;
    wire [31:0] P2, P3;
    wire [53:0] P4;
    
    rr_5x5_1 M1(A_H, B_H, P1);
    NR_5_27 M2(A_H, B_L, P2);
    NR_27_5 M3(A_L, B_H, P3);
    NR_27_27 M4(A_L, B_L, P4);
    
    wire[26:0] P4_L;
    wire[26:0] P4_H;

    wire[36:0] operand1;
    wire[32:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[26:0];
    assign P4_H = P4[53:27];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_5x5_1(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[4:4];
    assign B_H = B[4:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [0:0] P1;
    wire [3:0] P2, P3;
    wire [7:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_4 M2(A_H, B_L, P2);
    NR_4_1 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[4:0] operand1;
    wire[4:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[5:0],P4_L};
endmodule
        