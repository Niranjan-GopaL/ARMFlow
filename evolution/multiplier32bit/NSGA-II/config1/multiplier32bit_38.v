
module multiplier32bit_38(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [18:0] A_L, B_L;
    
    assign A_H = A[31:19];
    assign B_H = B[31:19];
    assign A_L = A[18:0];
    assign B_L = B[18:0];
    
    
    wire [25:0] P1;
    wire [31:0] P2, P3;
    wire [37:0] P4;
    
    rr_13x13_1 M1(A_H, B_H, P1);
    NR_13_19 M2(A_H, B_L, P2);
    NR_19_13 M3(A_L, B_H, P3);
    rr_19x19_16 M4(A_L, B_L, P4);
    
    wire[18:0] P4_L;
    wire[18:0] P4_H;

    wire[44:0] operand1;
    wire[32:0] operand2;
    wire[45:0] out;
    
    assign P4_L = P4[18:0];
    assign P4_H = P4[37:19];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder45_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[44:0],P4_L};
endmodule
        
module rr_13x13_1(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[12:10];
    assign B_H = B[12:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [5:0] P1;
    wire [12:0] P2, P3;
    wire [19:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_10 M2(A_H, B_L, P2);
    NR_10_3 M3(A_L, B_H, P3);
    rr_10x10_5 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[15:0] operand1;
    wire[13:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_10x10_5(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[9:7];
    assign B_H = B[9:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [5:0] P1;
    wire [9:0] P2, P3;
    wire [13:0] P4;
    
    rr_3x3_6 M1(A_H, B_H, P1);
    NR_3_7 M2(A_H, B_L, P2);
    NR_7_3 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[12:0] operand1;
    wire[10:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_3x3_6(
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
        
module rr_19x19_16(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[18:4];
    assign B_H = B[18:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [29:0] P1;
    wire [18:0] P2, P3;
    wire [7:0] P4;
    
    rr_15x15_17 M1(A_H, B_H, P1);
    NR_15_4 M2(A_H, B_L, P2);
    NR_4_15 M3(A_L, B_H, P3);
    rr_4x4_28 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[33:0] operand1;
    wire[19:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_15x15_17(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[14:3];
    assign B_H = B[14:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [23:0] P1;
    wire [14:0] P2, P3;
    wire [5:0] P4;
    
    NR_12_12 M1(A_H, B_H, P1);
    NR_12_3 M2(A_H, B_L, P2);
    NR_3_12 M3(A_L, B_H, P3);
    rr_3x3_21 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[26:0] operand1;
    wire[15:0] operand2;
    wire[27:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder27_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[26:0],P4_L};
endmodule
        
module rr_3x3_21(
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
        
module rr_4x4_28(
    input [3:0] A, 
    input [3:0] B, 
    output [7:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[3:2];
    assign B_H = B[3:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [3:0] P1;
    wire [3:0] P2, P3;
    wire [3:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_2 M2(A_H, B_L, P2);
    NR_2_2 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[5:0] operand1;
    wire[4:0] operand2;
    wire[6:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder6_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[5:0],P4_L};
endmodule
        