
module multiplier16bit_47(
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
    
    wire [0:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[12:12];
    assign B_H = B[12:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    wire [0:0] P1;
    wire [11:0] P2, P3;
    wire [23:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_12 M2(A_H, B_L, P2);
    NR_12_1 M3(A_L, B_H, P3);
    rr_12x12_8 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[12:0] operand1;
    wire[12:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_12x12_8(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[11:1];
    assign B_H = B[11:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [21:0] P1;
    wire [10:0] P2, P3;
    wire [0:0] P4;
    
    rr_11x11_9 M1(A_H, B_H, P1);
    NR_11_1 M2(A_H, B_L, P2);
    NR_1_11 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[22:0] operand1;
    wire[11:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_11x11_9(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[10:1];
    assign B_H = B[10:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [19:0] P1;
    wire [9:0] P2, P3;
    wire [0:0] P4;
    
    rr_10x10_10 M1(A_H, B_H, P1);
    NR_10_1 M2(A_H, B_L, P2);
    NR_1_10 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[20:0] operand1;
    wire[10:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_10x10_10(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[9:6];
    assign B_H = B[9:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [7:0] P1;
    wire [9:0] P2, P3;
    wire [11:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_6 M2(A_H, B_L, P2);
    NR_6_4 M3(A_L, B_H, P3);
    NR_6_6 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[13:0] operand1;
    wire[10:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        