
module multiplier16bit_38(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [9:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[15:6];
    assign B_H = B[15:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    
    wire [19:0] P1;
    wire [15:0] P2, P3;
    wire [11:0] P4;
    
    rr_10x10_1 M1(A_H, B_H, P1);
    NR_10_6 M2(A_H, B_L, P2);
    NR_6_10 M3(A_L, B_H, P3);
    rr_6x6_8 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[25:0] operand1;
    wire[16:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_10x10_1(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[9:1];
    assign B_H = B[9:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [17:0] P1;
    wire [8:0] P2, P3;
    wire [0:0] P4;
    
    NR_9_9 M1(A_H, B_H, P1);
    NR_9_1 M2(A_H, B_L, P2);
    NR_1_9 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[18:0] operand1;
    wire[9:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_6x6_8(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[5:3];
    assign B_H = B[5:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [5:0] P1;
    wire [5:0] P2, P3;
    wire [5:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    rr_3x3_10 M2(A_H, B_L, P2);
    NR_3_3 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[8:0] operand1;
    wire[6:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_3x3_10(
    input [2:0] A, 
    input [2:0] B, 
    output [5:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[2:1];
    assign B_H = B[2:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [3:0] P1;
    wire [1:0] P2, P3;
    wire [0:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_1 M2(A_H, B_L, P2);
    NR_1_2 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[4:0] operand1;
    wire[2:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder2_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[4:0],P4_L};
endmodule
        