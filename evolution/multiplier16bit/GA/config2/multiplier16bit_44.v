
module multiplier16bit_44(
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
    
    wire [8:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[13:5];
    assign B_H = B[13:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [17:0] P1;
    wire [13:0] P2, P3;
    wire [9:0] P4;
    
    rr_9x9_5 M1(A_H, B_H, P1);
    NR_9_5 M2(A_H, B_L, P2);
    NR_5_9 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[22:0] operand1;
    wire[14:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_9x9_5(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[8:6];
    assign B_H = B[8:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [5:0] P1;
    wire [8:0] P2, P3;
    wire [11:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_6 M2(A_H, B_L, P2);
    NR_6_3 M3(A_L, B_H, P3);
    rr_6x6_9 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[11:0] operand1;
    wire[9:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_6x6_9(
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
        