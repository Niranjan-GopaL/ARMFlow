
module multiplier32bit_13(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [24:0] A_L, B_L;
    
    assign A_H = A[31:25];
    assign B_H = B[31:25];
    assign A_L = A[24:0];
    assign B_L = B[24:0];
    
    
    wire [13:0] P1;
    wire [31:0] P2, P3;
    wire [49:0] P4;
    
    rr_7x7_1 M1(A_H, B_H, P1);
    NR_7_25 M2(A_H, B_L, P2);
    NR_25_7 M3(A_L, B_H, P3);
    rr_25x25_20 M4(A_L, B_L, P4);
    
    wire[24:0] P4_L;
    wire[24:0] P4_H;

    wire[38:0] operand1;
    wire[32:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[24:0];
    assign P4_H = P4[49:25];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        
module rr_7x7_1(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[6:2];
    assign B_H = B[6:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [9:0] P1;
    wire [6:0] P2, P3;
    wire [3:0] P4;
    
    rr_5x5_2 M1(A_H, B_H, P1);
    NR_5_2 M2(A_H, B_L, P2);
    NR_2_5 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[11:0] operand1;
    wire[7:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_5x5_2(
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
    rr_4x4_6 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_6(
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
    
    rr_3x3_7 M1(A_H, B_H, P1);
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
        
module rr_3x3_7(
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
        
module rr_25x25_20(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [17:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[24:7];
    assign B_H = B[24:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [35:0] P1;
    wire [24:0] P2, P3;
    wire [13:0] P4;
    
    rr_18x18_21 M1(A_H, B_H, P1);
    NR_18_7 M2(A_H, B_L, P2);
    NR_7_18 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[42:0] operand1;
    wire[25:0] operand2;
    wire[43:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder43_17 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[42:0],P4_L};
endmodule
        
module rr_18x18_21(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [15:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[17:2];
    assign B_H = B[17:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [31:0] P1;
    wire [17:0] P2, P3;
    wire [3:0] P4;
    
    rr_16x16_22 M1(A_H, B_H, P1);
    NR_16_2 M2(A_H, B_L, P2);
    NR_2_16 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[33:0] operand1;
    wire[18:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder18_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_15 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_16x16_22(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
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
    rr_13x13_26 M4(A_L, B_L, P4);
    
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
        
module rr_13x13_26(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[12:11];
    assign B_H = B[12:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [3:0] P1;
    wire [12:0] P2, P3;
    wire [21:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_11 M2(A_H, B_L, P2);
    NR_11_2 M3(A_L, B_H, P3);
    rr_11x11_30 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[14:0] operand1;
    wire[13:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_11x11_30(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[10:3];
    assign B_H = B[10:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [15:0] P1;
    wire [10:0] P2, P3;
    wire [5:0] P4;
    
    rr_8x8_31 M1(A_H, B_H, P1);
    NR_8_3 M2(A_H, B_L, P2);
    NR_3_8 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[18:0] operand1;
    wire[11:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_8x8_31(
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
    
    NR_6_6 M1(A_H, B_H, P1);
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
        