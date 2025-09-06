
module multiplier16bit_48(
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
    
    wire [2:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[14:12];
    assign B_H = B[14:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    wire [5:0] P1;
    wire [14:0] P2, P3;
    wire [23:0] P4;
    
    rr_3x3_2 M1(A_H, B_H, P1);
    NR_3_12 M2(A_H, B_L, P2);
    NR_12_3 M3(A_L, B_H, P3);
    rr_12x12_9 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[17:0] operand1;
    wire[15:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_3x3_2(
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
        
module rr_12x12_9(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[11:4];
    assign B_H = B[11:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [15:0] P1;
    wire [11:0] P2, P3;
    wire [7:0] P4;
    
    rr_8x8_10 M1(A_H, B_H, P1);
    NR_8_4 M2(A_H, B_L, P2);
    NR_4_8 M3(A_L, B_H, P3);
    rr_4x4_25 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[19:0] operand1;
    wire[12:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_8x8_10(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[7:6];
    assign B_H = B[7:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [3:0] P1;
    wire [7:0] P2, P3;
    wire [11:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_6 M2(A_H, B_L, P2);
    NR_6_2 M3(A_L, B_H, P3);
    rr_6x6_14 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[9:0] operand1;
    wire[8:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_6x6_14(
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
    rr_3x3_18 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_18(
    input [2:0] A, 
    input [2:0] B, 
    output [5:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[2:1];
    assign B_H = B[2:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [3:0] P1;
    wire [1:0] P2, P3;
    wire [0:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_1 M2(A_H, B_L, P2);
    NR_1_2 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[4:0] operand1;
    wire[2:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder2_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[4:0],P4_L};
endmodule
        
module rr_4x4_25(
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
        