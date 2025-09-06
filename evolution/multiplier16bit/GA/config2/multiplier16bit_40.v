
module multiplier16bit_40(
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
    
    wire [1:0] A_H, B_H;
    wire [12:0] A_L, B_L;
    
    assign A_H = A[14:13];
    assign B_H = B[14:13];
    assign A_L = A[12:0];
    assign B_L = B[12:0];
    
    wire [3:0] P1;
    wire [14:0] P2, P3;
    wire [25:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_13 M2(A_H, B_L, P2);
    NR_13_2 M3(A_L, B_H, P3);
    rr_13x13_5 M4(A_L, B_L, P4);
    
    wire[12:0] P4_L;
    wire[12:0] P4_H;

    wire[16:0] operand1;
    wire[15:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[12:0];
    assign P4_H = P4[25:13];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_13x13_5(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[12:1];
    assign B_H = B[12:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [23:0] P1;
    wire [11:0] P2, P3;
    wire [0:0] P4;
    
    rr_12x12_6 M1(A_H, B_H, P1);
    NR_12_1 M2(A_H, B_L, P2);
    NR_1_12 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[24:0] operand1;
    wire[12:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_12x12_6(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[11:5];
    assign B_H = B[11:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [13:0] P1;
    wire [11:0] P2, P3;
    wire [9:0] P4;
    
    rr_7x7_7 M1(A_H, B_H, P1);
    NR_7_5 M2(A_H, B_L, P2);
    NR_5_7 M3(A_L, B_H, P3);
    rr_5x5_14 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[18:0] operand1;
    wire[12:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_7x7_7(
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
    NR_6_6 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_14(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[4:4];
    assign B_H = B[4:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [0:0] P1;
    wire [3:0] P2, P3;
    wire [7:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_4 M2(A_H, B_L, P2);
    NR_4_1 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[4:0] operand1;
    wire[4:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[5:0],P4_L};
endmodule
        