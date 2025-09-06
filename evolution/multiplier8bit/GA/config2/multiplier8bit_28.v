
module multiplier8bit_28(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [6:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[7:1];
    assign B_H = B[7:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    
    wire [13:0] P1;
    wire [6:0] P2, P3;
    wire [0:0] P4;
    
    rr_7x7_1 M1(A_H, B_H, P1);
    NR_7_1 M2(A_H, B_L, P2);
    NR_1_7 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[14:0] operand1;
    wire[7:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_7x7_1(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[6:3];
    assign B_H = B[6:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [7:0] P1;
    wire [6:0] P2, P3;
    wire [5:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_3 M2(A_H, B_L, P2);
    NR_3_4 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[10:0] operand1;
    wire[7:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        