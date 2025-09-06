
module multiplier16bit_3(
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
    
    wire [9:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[12:3];
    assign B_H = B[12:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [19:0] P1;
    wire [12:0] P2, P3;
    wire [5:0] P4;
    
    rr_10x10_5 M1(A_H, B_H, P1);
    NR_10_3 M2(A_H, B_L, P2);
    NR_3_10 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[22:0] operand1;
    wire[13:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_10x10_5(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[9:4];
    assign B_H = B[9:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [11:0] P1;
    wire [9:0] P2, P3;
    wire [7:0] P4;
    
    NR_6_6 M1(A_H, B_H, P1);
    NR_6_4 M2(A_H, B_L, P2);
    NR_4_6 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[15:0] operand1;
    wire[10:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        