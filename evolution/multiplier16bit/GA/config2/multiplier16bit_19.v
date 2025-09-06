
module multiplier16bit_19(
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
    rr_7x7_16 M4(A_L, B_L, P4);
    
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
    
    rr_8x8_2 M1(A_H, B_H, P1);
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
        
module rr_8x8_2(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[7:2];
    assign B_H = B[7:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [11:0] P1;
    wire [7:0] P2, P3;
    wire [3:0] P4;
    
    rr_6x6_3 M1(A_H, B_H, P1);
    NR_6_2 M2(A_H, B_L, P2);
    NR_2_6 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[13:0] operand1;
    wire[8:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_6x6_3(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[5:3];
    assign B_H = B[5:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [5:0] P1;
    wire [5:0] P2, P3;
    wire [5:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_3 M2(A_H, B_L, P2);
    NR_3_3 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[8:0] operand1;
    wire[6:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_7x7_16(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[6:6];
    assign B_H = B[6:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [0:0] P1;
    wire [5:0] P2, P3;
    wire [11:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_6 M2(A_H, B_L, P2);
    NR_6_1 M3(A_L, B_H, P3);
    rr_6x6_20 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[6:0] operand1;
    wire[6:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_6x6_20(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[5:2];
    assign B_H = B[5:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [7:0] P1;
    wire [5:0] P2, P3;
    wire [3:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_2 M2(A_H, B_L, P2);
    NR_2_4 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[9:0] operand1;
    wire[6:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        