
module multiplier32bit_15(
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
    
    wire [21:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[27:6];
    assign B_H = B[27:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [43:0] P1;
    wire [27:0] P2, P3;
    wire [11:0] P4;
    
    rr_22x22_6 M1(A_H, B_H, P1);
    NR_22_6 M2(A_H, B_L, P2);
    NR_6_22 M3(A_L, B_H, P3);
    rr_6x6_73 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[49:0] operand1;
    wire[28:0] operand2;
    wire[50:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder50_21 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[49:0],P4_L};
endmodule
        
module rr_22x22_6(
    input [21:0] A, 
    input [21:0] B, 
    output [43:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[21:7];
    assign B_H = B[21:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [29:0] P1;
    wire [21:0] P2, P3;
    wire [13:0] P4;
    
    rr_15x15_7 M1(A_H, B_H, P1);
    NR_15_7 M2(A_H, B_L, P2);
    NR_7_15 M3(A_L, B_H, P3);
    rr_7x7_54 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[36:0] operand1;
    wire[22:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder22_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_15x15_7(
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
    
    rr_14x14_8 M1(A_H, B_H, P1);
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
        
module rr_14x14_8(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[13:7];
    assign B_H = B[13:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [13:0] P1;
    wire [13:0] P2, P3;
    wire [13:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    rr_7x7_10 M2(A_H, B_L, P2);
    rr_7x7_23 M3(A_L, B_H, P3);
    rr_7x7_36 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[20:0] operand1;
    wire[14:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_7x7_10(
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
    
    rr_5x5_11 M1(A_H, B_H, P1);
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
        
module rr_5x5_11(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[4:2];
    assign B_H = B[4:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [5:0] P1;
    wire [4:0] P2, P3;
    wire [3:0] P4;
    
    rr_3x3_12 M1(A_H, B_H, P1);
    NR_3_2 M2(A_H, B_L, P2);
    NR_2_3 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[7:0] operand1;
    wire[5:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_3x3_12(
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
        
module rr_7x7_23(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[6:3];
    assign B_H = B[6:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [7:0] P1;
    wire [6:0] P2, P3;
    wire [5:0] P4;
    
    rr_4x4_24 M1(A_H, B_H, P1);
    NR_4_3 M2(A_H, B_L, P2);
    NR_3_4 M3(A_L, B_H, P3);
    rr_3x3_31 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[10:0] operand1;
    wire[7:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_4x4_24(
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
        
module rr_3x3_31(
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
        
module rr_7x7_36(
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
    
    rr_5x5_37 M1(A_H, B_H, P1);
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
        
module rr_5x5_37(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[4:2];
    assign B_H = B[4:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [5:0] P1;
    wire [4:0] P2, P3;
    wire [3:0] P4;
    
    rr_3x3_38 M1(A_H, B_H, P1);
    NR_3_2 M2(A_H, B_L, P2);
    NR_2_3 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[7:0] operand1;
    wire[5:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_3x3_38(
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
        
module rr_7x7_54(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[6:1];
    assign B_H = B[6:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [11:0] P1;
    wire [5:0] P2, P3;
    wire [0:0] P4;
    
    rr_6x6_55 M1(A_H, B_H, P1);
    NR_6_1 M2(A_H, B_L, P2);
    NR_1_6 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[12:0] operand1;
    wire[6:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_6x6_55(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[5:1];
    assign B_H = B[5:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [9:0] P1;
    wire [4:0] P2, P3;
    wire [0:0] P4;
    
    rr_5x5_56 M1(A_H, B_H, P1);
    NR_5_1 M2(A_H, B_L, P2);
    NR_1_5 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[10:0] operand1;
    wire[5:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_5x5_56(
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
    rr_4x4_60 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_60(
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
        
module rr_6x6_73(
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
    NR_4_4 M4(A_L, B_L, P4);
    
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
        