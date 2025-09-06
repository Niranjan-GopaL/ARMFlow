
module multiplier8bit_46(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [0:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[7:7];
    assign B_H = B[7:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    
    wire [0:0] P1;
    wire [6:0] P2, P3;
    wire [13:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_7 M2(A_H, B_L, P2);
    NR_7_1 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[7:0] operand1;
    wire[7:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        