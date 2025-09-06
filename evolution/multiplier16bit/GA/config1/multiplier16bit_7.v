
module multiplier16bit_7(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [4:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[15:11];
    assign B_H = B[15:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    
    wire [9:0] P1;
    wire [15:0] P2, P3;
    wire [21:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_11 M2(A_H, B_L, P2);
    NR_11_5 M3(A_L, B_H, P3);
    NR_11_11 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[20:0] operand1;
    wire[16:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        