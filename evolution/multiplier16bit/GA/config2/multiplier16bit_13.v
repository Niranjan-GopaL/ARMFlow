
module multiplier16bit_13(
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
    
    wire [10:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[13:3];
    assign B_H = B[13:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [21:0] P1;
    wire [13:0] P2, P3;
    wire [5:0] P4;
    
    rr_11x11_5 M1(A_H, B_H, P1);
    NR_11_3 M2(A_H, B_L, P2);
    NR_3_11 M3(A_L, B_H, P3);
    rr_3x3_16 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[24:0] operand1;
    wire[14:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_11x11_5(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[10:10];
    assign B_H = B[10:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [0:0] P1;
    wire [9:0] P2, P3;
    wire [19:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_10 M2(A_H, B_L, P2);
    NR_10_1 M3(A_L, B_H, P3);
    rr_10x10_9 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[10:0] operand1;
    wire[10:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_10x10_9(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[9:2];
    assign B_H = B[9:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [15:0] P1;
    wire [9:0] P2, P3;
    wire [3:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_2 M2(A_H, B_L, P2);
    NR_2_8 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[17:0] operand1;
    wire[10:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_3x3_16(
    input [2:0] A, 
    input [2:0] B, 
    output [5:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[2:2];
    assign B_H = B[2:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [0:0] P1;
    wire [1:0] P2, P3;
    wire [3:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_2 M2(A_H, B_L, P2);
    NR_2_1 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[2:0] operand1;
    wire[2:0] operand2;
    wire[3:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder2_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder3_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[3:0],P4_L};
endmodule
        