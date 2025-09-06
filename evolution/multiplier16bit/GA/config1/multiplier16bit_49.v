
module multiplier16bit_49(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [13:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[15:2];
    assign B_H = B[15:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    
    wire [27:0] P1;
    wire [15:0] P2, P3;
    wire [3:0] P4;
    
    rr_14x14_1 M1(A_H, B_H, P1);
    NR_14_2 M2(A_H, B_L, P2);
    NR_2_14 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[29:0] operand1;
    wire[16:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_14x14_1(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[13:2];
    assign B_H = B[13:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [23:0] P1;
    wire [13:0] P2, P3;
    wire [3:0] P4;
    
    NR_12_12 M1(A_H, B_H, P1);
    NR_12_2 M2(A_H, B_L, P2);
    NR_2_12 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[25:0] operand1;
    wire[14:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        