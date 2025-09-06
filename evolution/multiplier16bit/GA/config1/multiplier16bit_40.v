
module multiplier16bit_40(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [0:0] A_H, B_H;
    wire [14:0] A_L, B_L;
    
    assign A_H = A[15:15];
    assign B_H = B[15:15];
    assign A_L = A[14:0];
    assign B_L = B[14:0];
    
    
    wire [0:0] P1;
    wire [14:0] P2, P3;
    wire [29:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_15 M2(A_H, B_L, P2);
    NR_15_1 M3(A_L, B_H, P3);
    rr_15x15_4 M4(A_L, B_L, P4);
    
    wire[14:0] P4_L;
    wire[14:0] P4_H;

    wire[15:0] operand1;
    wire[15:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[14:0];
    assign P4_H = P4[29:15];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_15x15_4(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[14:1];
    assign B_H = B[14:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [27:0] P1;
    wire [13:0] P2, P3;
    wire [0:0] P4;
    
    NR_14_14 M1(A_H, B_H, P1);
    NR_14_1 M2(A_H, B_L, P2);
    NR_1_14 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[28:0] operand1;
    wire[14:0] operand2;
    wire[29:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder29_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[28:0],P4_L};
endmodule
        