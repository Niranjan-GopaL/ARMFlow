
module multiplier16bit_8(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [8:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[15:7];
    assign B_H = B[15:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    
    wire [17:0] P1;
    wire [15:0] P2, P3;
    wire [13:0] P4;
    
    rr_9x9_1 M1(A_H, B_H, P1);
    NR_9_7 M2(A_H, B_L, P2);
    NR_7_9 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[24:0] operand1;
    wire[16:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_9x9_1(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[8:1];
    assign B_H = B[8:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [15:0] P1;
    wire [7:0] P2, P3;
    wire [0:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_1 M2(A_H, B_L, P2);
    NR_1_8 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[16:0] operand1;
    wire[8:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        