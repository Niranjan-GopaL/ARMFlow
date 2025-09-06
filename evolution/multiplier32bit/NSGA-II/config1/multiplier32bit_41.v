
module multiplier32bit_41(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [29:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[31:2];
    assign B_H = B[31:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    
    wire [59:0] P1;
    wire [31:0] P2, P3;
    wire [3:0] P4;
    
    rr_30x30_1 M1(A_H, B_H, P1);
    NR_30_2 M2(A_H, B_L, P2);
    NR_2_30 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[61:0] operand1;
    wire[32:0] operand2;
    wire[62:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder62_29 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[61:0],P4_L};
endmodule
        
module rr_30x30_1(
    input [29:0] A, 
    input [29:0] B, 
    output [59:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[29:28];
    assign B_H = B[29:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    wire [3:0] P1;
    wire [29:0] P2, P3;
    wire [55:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_28 M2(A_H, B_L, P2);
    NR_28_2 M3(A_L, B_H, P3);
    rr_28x28_5 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[31:0] operand1;
    wire[30:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder30_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[31:0],P4_L};
endmodule
        
module rr_28x28_5(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [18:0] A_L, B_L;
    
    assign A_H = A[27:19];
    assign B_H = B[27:19];
    assign A_L = A[18:0];
    assign B_L = B[18:0];
    
    wire [17:0] P1;
    wire [27:0] P2, P3;
    wire [37:0] P4;
    
    NR_9_9 M1(A_H, B_H, P1);
    NR_9_19 M2(A_H, B_L, P2);
    NR_19_9 M3(A_L, B_H, P3);
    rr_19x19_9 M4(A_L, B_L, P4);
    
    wire[18:0] P4_L;
    wire[18:0] P4_H;

    wire[36:0] operand1;
    wire[28:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[18:0];
    assign P4_H = P4[37:19];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_19x19_9(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[18:6];
    assign B_H = B[18:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [25:0] P1;
    wire [18:0] P2, P3;
    wire [11:0] P4;
    
    rr_13x13_10 M1(A_H, B_H, P1);
    NR_13_6 M2(A_H, B_L, P2);
    NR_6_13 M3(A_L, B_H, P3);
    rr_6x6_45 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[31:0] operand1;
    wire[19:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[31:0],P4_L};
endmodule
        
module rr_13x13_10(
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
    rr_11x11_14 M4(A_L, B_L, P4);
    
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
        
module rr_11x11_14(
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
    
    rr_10x10_15 M1(A_H, B_H, P1);
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
        
module rr_10x10_15(
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
    
    rr_6x6_16 M1(A_H, B_H, P1);
    NR_6_4 M2(A_H, B_L, P2);
    NR_4_6 M3(A_L, B_H, P3);
    rr_4x4_31 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_16(
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
    
    rr_3x3_17 M1(A_H, B_H, P1);
    NR_3_3 M2(A_H, B_L, P2);
    rr_3x3_23 M3(A_L, B_H, P3);
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
        
module rr_3x3_17(
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
        
module rr_3x3_23(
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
        
module rr_4x4_31(
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
    rr_3x3_35 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_35(
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
        
module rr_6x6_45(
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
    
    rr_3x3_46 M1(A_H, B_H, P1);
    rr_3x3_51 M2(A_H, B_L, P2);
    NR_3_3 M3(A_L, B_H, P3);
    rr_3x3_57 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_46(
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
        
module rr_3x3_51(
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
        
module rr_3x3_57(
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
        