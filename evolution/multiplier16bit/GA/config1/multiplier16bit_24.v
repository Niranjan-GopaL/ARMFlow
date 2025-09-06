
module multiplier16bit_24(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [1:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[15:14];
    assign B_H = B[15:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    
    wire [3:0] P1;
    wire [15:0] P2, P3;
    wire [27:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_14 M2(A_H, B_L, P2);
    NR_14_2 M3(A_L, B_H, P3);
    rr_14x14_4 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[17:0] operand1;
    wire[16:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_14x14_4(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[13:10];
    assign B_H = B[13:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [7:0] P1;
    wire [13:0] P2, P3;
    wire [19:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_10 M2(A_H, B_L, P2);
    NR_10_4 M3(A_L, B_H, P3);
    rr_10x10_8 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[17:0] operand1;
    wire[14:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_10x10_8(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[9:8];
    assign B_H = B[9:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [3:0] P1;
    wire [9:0] P2, P3;
    wire [15:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_8 M2(A_H, B_L, P2);
    NR_8_2 M3(A_L, B_H, P3);
    NR_8_8 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[11:0] operand1;
    wire[10:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        