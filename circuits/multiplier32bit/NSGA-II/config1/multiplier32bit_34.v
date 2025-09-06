
module multiplier32bit_34(
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
    rr_27x27_8 M4(A_L, B_L, P4);
    
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
    
    wire [1:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[4:3];
    assign B_H = B[4:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [3:0] P1;
    wire [4:0] P2, P3;
    wire [5:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_3 M2(A_H, B_L, P2);
    NR_3_2 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[6:0] operand1;
    wire[5:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[6:0],P4_L};
endmodule
        
module rr_27x27_8(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [19:0] A_L, B_L;
    
    assign A_H = A[26:20];
    assign B_H = B[26:20];
    assign A_L = A[19:0];
    assign B_L = B[19:0];
    
    wire [13:0] P1;
    wire [26:0] P2, P3;
    wire [39:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_20 M2(A_H, B_L, P2);
    NR_20_7 M3(A_L, B_H, P3);
    NR_20_20 M4(A_L, B_L, P4);
    
    wire[19:0] P4_L;
    wire[19:0] P4_H;

    wire[33:0] operand1;
    wire[27:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[19:0];
    assign P4_H = P4[39:20];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        