
module multiplier32bit_34(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [20:0] A_L, B_L;
    
    assign A_H = A[31:21];
    assign B_H = B[31:21];
    assign A_L = A[20:0];
    assign B_L = B[20:0];
    
    
    wire [21:0] P1;
    wire [31:0] P2, P3;
    wire [41:0] P4;
    
    rr_11x11_1 M1(A_H, B_H, P1);
    NR_11_21 M2(A_H, B_L, P2);
    NR_21_11 M3(A_L, B_H, P3);
    rr_21x21_12 M4(A_L, B_L, P4);
    
    wire[20:0] P4_L;
    wire[20:0] P4_H;

    wire[42:0] operand1;
    wire[32:0] operand2;
    wire[43:0] out;
    
    assign P4_L = P4[20:0];
    assign P4_H = P4[41:21];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder43_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[42:0],P4_L};
endmodule
        
module rr_11x11_1(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[10:2];
    assign B_H = B[10:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [17:0] P1;
    wire [10:0] P2, P3;
    wire [3:0] P4;
    
    rr_9x9_2 M1(A_H, B_H, P1);
    NR_9_2 M2(A_H, B_L, P2);
    NR_2_9 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[19:0] operand1;
    wire[11:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_9x9_2(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[8:2];
    assign B_H = B[8:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [13:0] P1;
    wire [8:0] P2, P3;
    wire [3:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_2 M2(A_H, B_L, P2);
    NR_2_7 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[15:0] operand1;
    wire[9:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_21x21_12(
    input [20:0] A, 
    input [20:0] B, 
    output [41:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [15:0] A_L, B_L;
    
    assign A_H = A[20:16];
    assign B_H = B[20:16];
    assign A_L = A[15:0];
    assign B_L = B[15:0];
    
    wire [9:0] P1;
    wire [20:0] P2, P3;
    wire [31:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_16 M2(A_H, B_L, P2);
    NR_16_5 M3(A_L, B_H, P3);
    rr_16x16_16 M4(A_L, B_L, P4);
    
    wire[15:0] P4_L;
    wire[15:0] P4_H;

    wire[25:0] operand1;
    wire[21:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[15:0];
    assign P4_H = P4[31:16];
    assign operand1 = {P1,P4_H};

    customAdder21_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_16x16_16(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[15:2];
    assign B_H = B[15:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [27:0] P1;
    wire [15:0] P2, P3;
    wire [3:0] P4;
    
    rr_14x14_17 M1(A_H, B_H, P1);
    NR_14_2 M2(A_H, B_L, P2);
    NR_2_14 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[29:0] operand1;
    wire[16:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_14x14_17(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[13:2];
    assign B_H = B[13:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [23:0] P1;
    wire [13:0] P2, P3;
    wire [3:0] P4;
    
    rr_12x12_18 M1(A_H, B_H, P1);
    NR_12_2 M2(A_H, B_L, P2);
    NR_2_12 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[25:0] operand1;
    wire[14:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_12x12_18(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[11:9];
    assign B_H = B[11:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [5:0] P1;
    wire [11:0] P2, P3;
    wire [17:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_9 M2(A_H, B_L, P2);
    NR_9_3 M3(A_L, B_H, P3);
    rr_9x9_22 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[14:0] operand1;
    wire[12:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_9x9_22(
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
    rr_6x6_26 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_26(
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
    
    rr_4x4_27 M1(A_H, B_H, P1);
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
        
module rr_4x4_27(
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
    
    rr_3x3_28 M1(A_H, B_H, P1);
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
        
module rr_3x3_28(
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
        