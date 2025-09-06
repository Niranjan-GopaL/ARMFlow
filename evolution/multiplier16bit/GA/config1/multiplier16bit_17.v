
module multiplier16bit_17(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [12:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[15:3];
    assign B_H = B[15:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    
    wire [25:0] P1;
    wire [15:0] P2, P3;
    wire [5:0] P4;
    
    NR_13_13 M1(A_H, B_H, P1);
    NR_13_3 M2(A_H, B_L, P2);
    NR_3_13 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[28:0] operand1;
    wire[16:0] operand2;
    wire[29:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder29_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[28:0],P4_L};
endmodule
        