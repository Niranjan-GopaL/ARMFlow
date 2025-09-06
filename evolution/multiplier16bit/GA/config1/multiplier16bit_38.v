
module multiplier16bit_38(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [11:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[15:4];
    assign B_H = B[15:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    
    wire [23:0] P1;
    wire [15:0] P2, P3;
    wire [7:0] P4;
    
    NR_12_12 M1(A_H, B_H, P1);
    NR_12_4 M2(A_H, B_L, P2);
    NR_4_12 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[27:0] operand1;
    wire[16:0] operand2;
    wire[28:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder28_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[27:0],P4_L};
endmodule
        