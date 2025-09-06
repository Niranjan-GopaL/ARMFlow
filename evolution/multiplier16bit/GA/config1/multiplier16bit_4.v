
module multiplier16bit_4(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [6:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[15:9];
    assign B_H = B[15:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    
    wire [13:0] P1;
    wire [15:0] P2, P3;
    wire [17:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_9 M2(A_H, B_L, P2);
    NR_9_7 M3(A_L, B_H, P3);
    rr_9x9_4 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[22:0] operand1;
    wire[16:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_9x9_4(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[8:6];
    assign B_H = B[8:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [5:0] P1;
    wire [8:0] P2, P3;
    wire [11:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_6 M2(A_H, B_L, P2);
    NR_6_3 M3(A_L, B_H, P3);
    NR_6_6 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[11:0] operand1;
    wire[9:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        