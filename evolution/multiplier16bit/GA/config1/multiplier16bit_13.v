
module multiplier16bit_13(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [2:0] A_H, B_H;
    wire [12:0] A_L, B_L;
    
    assign A_H = A[15:13];
    assign B_H = B[15:13];
    assign A_L = A[12:0];
    assign B_L = B[12:0];
    
    
    wire [5:0] P1;
    wire [15:0] P2, P3;
    wire [25:0] P4;
    
    rr_3x3_1 M1(A_H, B_H, P1);
    NR_3_13 M2(A_H, B_L, P2);
    NR_13_3 M3(A_L, B_H, P3);
    rr_13x13_8 M4(A_L, B_L, P4);
    
    wire[12:0] P4_L;
    wire[12:0] P4_H;

    wire[18:0] operand1;
    wire[16:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[12:0];
    assign P4_H = P4[25:13];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_3x3_1(
    input [2:0] A, 
    input [2:0] B, 
    output [5:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[2:1];
    assign B_H = B[2:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [3:0] P1;
    wire [1:0] P2, P3;
    wire [0:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_1 M2(A_H, B_L, P2);
    NR_1_2 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[4:0] operand1;
    wire[2:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder2_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[4:0],P4_L};
endmodule
        
module rr_13x13_8(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[12:8];
    assign B_H = B[12:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [9:0] P1;
    wire [12:0] P2, P3;
    wire [15:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_8 M2(A_H, B_L, P2);
    NR_8_5 M3(A_L, B_H, P3);
    NR_8_8 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[17:0] operand1;
    wire[13:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        