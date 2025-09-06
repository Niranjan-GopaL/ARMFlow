
module multiplier16bit_39(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [14:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[15:1];
    assign B_H = B[15:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    
    wire [29:0] P1;
    wire [14:0] P2, P3;
    wire [0:0] P4;
    
    rr_15x15_1 M1(A_H, B_H, P1);
    NR_15_1 M2(A_H, B_L, P2);
    NR_1_15 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[30:0] operand1;
    wire[15:0] operand2;
    wire[31:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder31_15 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[30:0],P4_L};
endmodule
        
module rr_15x15_1(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[14:5];
    assign B_H = B[14:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [19:0] P1;
    wire [14:0] P2, P3;
    wire [9:0] P4;
    
    rr_10x10_2 M1(A_H, B_H, P1);
    NR_10_5 M2(A_H, B_L, P2);
    NR_5_10 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[24:0] operand1;
    wire[15:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_10x10_2(
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
        