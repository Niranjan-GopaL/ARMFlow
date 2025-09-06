
module multiplier16bit_43(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [3:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[15:12];
    assign B_H = B[15:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    
    wire [7:0] P1;
    wire [15:0] P2, P3;
    wire [23:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_12 M2(A_H, B_L, P2);
    NR_12_4 M3(A_L, B_H, P3);
    rr_12x12_4 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[19:0] operand1;
    wire[16:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_12x12_4(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[11:10];
    assign B_H = B[11:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [3:0] P1;
    wire [11:0] P2, P3;
    wire [19:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_10 M2(A_H, B_L, P2);
    NR_10_2 M3(A_L, B_H, P3);
    rr_10x10_8 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[13:0] operand1;
    wire[12:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_10x10_8(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[9:9];
    assign B_H = B[9:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [0:0] P1;
    wire [8:0] P2, P3;
    wire [17:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_9 M2(A_H, B_L, P2);
    NR_9_1 M3(A_L, B_H, P3);
    NR_9_9 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[9:0] operand1;
    wire[9:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        