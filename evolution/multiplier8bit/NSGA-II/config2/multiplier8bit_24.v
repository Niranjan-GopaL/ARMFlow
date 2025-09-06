
module multiplier8bit_24(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [4:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[7:3];
    assign B_H = B[7:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    
    wire [9:0] P1;
    wire [7:0] P2, P3;
    wire [5:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_3 M2(A_H, B_L, P2);
    NR_3_5 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[12:0] operand1;
    wire[8:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        