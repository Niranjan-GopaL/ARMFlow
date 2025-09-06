
module multiplier16bit_33(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [5:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[15:10];
    assign B_H = B[15:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    
    wire [11:0] P1;
    wire [15:0] P2, P3;
    wire [19:0] P4;
    
    NR_6_6 M1(A_H, B_H, P1);
    NR_6_10 M2(A_H, B_L, P2);
    NR_10_6 M3(A_L, B_H, P3);
    NR_10_10 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[21:0] operand1;
    wire[16:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        