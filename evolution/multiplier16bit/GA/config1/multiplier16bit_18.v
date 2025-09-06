
module multiplier16bit_18(
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
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_13 M2(A_H, B_L, P2);
    NR_13_3 M3(A_L, B_H, P3);
    rr_13x13_4 M4(A_L, B_L, P4);
    
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
        
module rr_13x13_4(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[12:4];
    assign B_H = B[12:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [17:0] P1;
    wire [12:0] P2, P3;
    wire [7:0] P4;
    
    rr_9x9_5 M1(A_H, B_H, P1);
    NR_9_4 M2(A_H, B_L, P2);
    NR_4_9 M3(A_L, B_H, P3);
    rr_4x4_12 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[21:0] operand1;
    wire[13:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_9x9_5(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[8:3];
    assign B_H = B[8:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [11:0] P1;
    wire [8:0] P2, P3;
    wire [5:0] P4;
    
    NR_6_6 M1(A_H, B_H, P1);
    NR_6_3 M2(A_H, B_L, P2);
    NR_3_6 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[14:0] operand1;
    wire[9:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_4x4_12(
    input [3:0] A, 
    input [3:0] B, 
    output [7:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[3:1];
    assign B_H = B[3:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [5:0] P1;
    wire [2:0] P2, P3;
    wire [0:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_1 M2(A_H, B_L, P2);
    NR_1_3 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[6:0] operand1;
    wire[3:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder3_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[6:0],P4_L};
endmodule
        