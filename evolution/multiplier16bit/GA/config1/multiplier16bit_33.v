
module multiplier16bit_33(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [2:0] A_H, B_H;
    wire [12:0] A_L, B_L;
    
    assign A_H = A[15:13];
    assign B_H = B[15:13];
    assign A_L = A[12:0];
    assign B_L = B[12:0];
    
    
    wire [5:0] P1;
    wire [15:0] P2, P3;
    wire [25:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_13 M2(A_H, B_L, P2);
    NR_13_3 M3(A_L, B_H, P3);
    rr_13x13_4 M4(A_L, B_L, P4);
    
    wire[12:0] P4_L;
    wire[12:0] P4_H;

    wire[18:0] operand1;
    wire[16:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[12:0];
    assign P4_H = P4[25:13];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_13x13_4(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[12:1];
    assign B_H = B[12:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [23:0] P1;
    wire [11:0] P2, P3;
    wire [0:0] P4;
    
    NR_12_12 M1(A_H, B_H, P1);
    NR_12_1 M2(A_H, B_L, P2);
    NR_1_12 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[24:0] operand1;
    wire[12:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        