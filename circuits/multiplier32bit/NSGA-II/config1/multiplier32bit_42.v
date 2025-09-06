
module multiplier32bit_42(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [30:0] A_L, B_L;
    
    assign A_H = A[31:31];
    assign B_H = B[31:31];
    assign A_L = A[30:0];
    assign B_L = B[30:0];
    
    
    wire [0:0] P1;
    wire [30:0] P2, P3;
    wire [61:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_31 M2(A_H, B_L, P2);
    NR_31_1 M3(A_L, B_H, P3);
    rr_31x31_4 M4(A_L, B_L, P4);
    
    wire[30:0] P4_L;
    wire[30:0] P4_H;

    wire[31:0] operand1;
    wire[31:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[30:0];
    assign P4_H = P4[61:31];
    assign operand1 = {P1,P4_H};

    customAdder31_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
endmodule
        
module rr_31x31_4(
    input [30:0] A, 
    input [30:0] B, 
    output [61:0] P
);
    
    wire [27:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[30:3];
    assign B_H = B[30:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [55:0] P1;
    wire [30:0] P2, P3;
    wire [5:0] P4;
    
    rr_28x28_5 M1(A_H, B_H, P1);
    NR_28_3 M2(A_H, B_L, P2);
    NR_3_28 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[58:0] operand1;
    wire[31:0] operand2;
    wire[59:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder31_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder59_27 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[58:0],P4_L};
endmodule
        
module rr_28x28_5(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [14:0] A_L, B_L;
    
    assign A_H = A[27:15];
    assign B_H = B[27:15];
    assign A_L = A[14:0];
    assign B_L = B[14:0];
    
    wire [25:0] P1;
    wire [27:0] P2, P3;
    wire [29:0] P4;
    
    rr_13x13_6 M1(A_H, B_H, P1);
    NR_13_15 M2(A_H, B_L, P2);
    NR_15_13 M3(A_L, B_H, P3);
    rr_15x15_41 M4(A_L, B_L, P4);
    
    wire[14:0] P4_L;
    wire[14:0] P4_H;

    wire[40:0] operand1;
    wire[28:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[14:0];
    assign P4_H = P4[29:15];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_13x13_6(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[12:6];
    assign B_H = B[12:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [13:0] P1;
    wire [12:0] P2, P3;
    wire [11:0] P4;
    
    rr_7x7_7 M1(A_H, B_H, P1);
    NR_7_6 M2(A_H, B_L, P2);
    NR_6_7 M3(A_L, B_H, P3);
    rr_6x6_30 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[19:0] operand1;
    wire[13:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
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
    rr_6x6_11 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_11(
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
    
    rr_3x3_12 M1(A_H, B_H, P1);
    rr_3x3_17 M2(A_H, B_L, P2);
    rr_3x3_22 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_12(
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
        
module rr_3x3_17(
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
        
module rr_3x3_22(
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
        
module rr_6x6_30(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[5:4];
    assign B_H = B[5:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [3:0] P1;
    wire [5:0] P2, P3;
    wire [7:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_4 M2(A_H, B_L, P2);
    NR_4_2 M3(A_L, B_H, P3);
    rr_4x4_34 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[7:0] operand1;
    wire[6:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_4x4_34(
    input [3:0] A, 
    input [3:0] B, 
    output [7:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[3:2];
    assign B_H = B[3:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [3:0] P1;
    wire [3:0] P2, P3;
    wire [3:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_2 M2(A_H, B_L, P2);
    NR_2_2 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[5:0] operand1;
    wire[4:0] operand2;
    wire[6:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder6_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[5:0],P4_L};
endmodule
        
module rr_15x15_41(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[14:14];
    assign B_H = B[14:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    wire [0:0] P1;
    wire [13:0] P2, P3;
    wire [27:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_14 M2(A_H, B_L, P2);
    NR_14_1 M3(A_L, B_H, P3);
    rr_14x14_45 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[14:0] operand1;
    wire[14:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_14x14_45(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[13:12];
    assign B_H = B[13:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    wire [3:0] P1;
    wire [13:0] P2, P3;
    wire [23:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_12 M2(A_H, B_L, P2);
    NR_12_2 M3(A_L, B_H, P3);
    rr_12x12_49 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[15:0] operand1;
    wire[14:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_12x12_49(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[11:3];
    assign B_H = B[11:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [17:0] P1;
    wire [11:0] P2, P3;
    wire [5:0] P4;
    
    rr_9x9_50 M1(A_H, B_H, P1);
    NR_9_3 M2(A_H, B_L, P2);
    NR_3_9 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[20:0] operand1;
    wire[12:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_9x9_50(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[8:8];
    assign B_H = B[8:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [0:0] P1;
    wire [7:0] P2, P3;
    wire [15:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_8 M2(A_H, B_L, P2);
    NR_8_1 M3(A_L, B_H, P3);
    rr_8x8_54 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[8:0] operand1;
    wire[8:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_8x8_54(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[7:5];
    assign B_H = B[7:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [5:0] P1;
    wire [7:0] P2, P3;
    wire [9:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_5 M2(A_H, B_L, P2);
    NR_5_3 M3(A_L, B_H, P3);
    rr_5x5_58 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[10:0] operand1;
    wire[8:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_5x5_58(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[4:1];
    assign B_H = B[4:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [7:0] P1;
    wire [3:0] P2, P3;
    wire [0:0] P4;
    
    rr_4x4_59 M1(A_H, B_H, P1);
    NR_4_1 M2(A_H, B_L, P2);
    NR_1_4 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[8:0] operand1;
    wire[4:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_4x4_59(
    input [3:0] A, 
    input [3:0] B, 
    output [7:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[3:3];
    assign B_H = B[3:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [0:0] P1;
    wire [2:0] P2, P3;
    wire [5:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_3 M2(A_H, B_L, P2);
    NR_3_1 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[3:0] operand1;
    wire[3:0] operand2;
    wire[4:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder3_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder4_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[4:0],P4_L};
endmodule
        