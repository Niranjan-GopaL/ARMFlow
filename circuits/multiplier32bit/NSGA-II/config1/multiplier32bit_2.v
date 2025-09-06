
module multiplier32bit_2(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [17:0] A_L, B_L;
    
    assign A_H = A[31:18];
    assign B_H = B[31:18];
    assign A_L = A[17:0];
    assign B_L = B[17:0];
    
    
    wire [27:0] P1;
    wire [31:0] P2, P3;
    wire [35:0] P4;
    
    rr_14x14_1 M1(A_H, B_H, P1);
    NR_14_18 M2(A_H, B_L, P2);
    NR_18_14 M3(A_L, B_H, P3);
    rr_18x18_40 M4(A_L, B_L, P4);
    
    wire[17:0] P4_L;
    wire[17:0] P4_H;

    wire[45:0] operand1;
    wire[32:0] operand2;
    wire[46:0] out;
    
    assign P4_L = P4[17:0];
    assign P4_H = P4[35:18];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder46_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[45:0],P4_L};
endmodule
        
module rr_14x14_1(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[13:11];
    assign B_H = B[13:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [5:0] P1;
    wire [13:0] P2, P3;
    wire [21:0] P4;
    
    rr_3x3_2 M1(A_H, B_H, P1);
    NR_3_11 M2(A_H, B_L, P2);
    NR_11_3 M3(A_L, B_H, P3);
    rr_11x11_9 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[16:0] operand1;
    wire[14:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_3x3_2(
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
    
    wire [4:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[9:5];
    assign B_H = B[9:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [9:0] P1;
    wire [9:0] P2, P3;
    wire [9:0] P4;
    
    rr_5x5_11 M1(A_H, B_H, P1);
    rr_5x5_20 M2(A_H, B_L, P2);
    rr_5x5_25 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[14:0] operand1;
    wire[10:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_5x5_11(
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
    
    rr_4x4_12 M1(A_H, B_H, P1);
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
        
module rr_4x4_12(
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
        
module rr_5x5_20(
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
    
    NR_3_3 M1(A_H, B_H, P1);
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
        
module rr_5x5_25(
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
    rr_4x4_29 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_29(
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
        
module rr_18x18_40(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [16:0] A_L, B_L;
    
    assign A_H = A[17:17];
    assign B_H = B[17:17];
    assign A_L = A[16:0];
    assign B_L = B[16:0];
    
    wire [0:0] P1;
    wire [16:0] P2, P3;
    wire [33:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_17 M2(A_H, B_L, P2);
    NR_17_1 M3(A_L, B_H, P3);
    rr_17x17_44 M4(A_L, B_L, P4);
    
    wire[16:0] P4_L;
    wire[16:0] P4_H;

    wire[17:0] operand1;
    wire[17:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[16:0];
    assign P4_H = P4[33:17];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_17x17_44(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[16:12];
    assign B_H = B[16:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    wire [9:0] P1;
    wire [16:0] P2, P3;
    wire [23:0] P4;
    
    rr_5x5_45 M1(A_H, B_H, P1);
    NR_5_12 M2(A_H, B_L, P2);
    NR_12_5 M3(A_L, B_H, P3);
    rr_12x12_60 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[21:0] operand1;
    wire[17:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_5x5_45(
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
    rr_4x4_49 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_49(
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
    
    rr_3x3_50 M1(A_H, B_H, P1);
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
        
module rr_3x3_50(
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
        
module rr_12x12_60(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[11:8];
    assign B_H = B[11:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [7:0] P1;
    wire [11:0] P2, P3;
    wire [15:0] P4;
    
    rr_4x4_61 M1(A_H, B_H, P1);
    NR_4_8 M2(A_H, B_L, P2);
    NR_8_4 M3(A_L, B_H, P3);
    rr_8x8_68 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[15:0] operand1;
    wire[12:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_4x4_61(
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
        
module rr_8x8_68(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[7:7];
    assign B_H = B[7:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [0:0] P1;
    wire [6:0] P2, P3;
    wire [13:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_7 M2(A_H, B_L, P2);
    NR_7_1 M3(A_L, B_H, P3);
    rr_7x7_72 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[7:0] operand1;
    wire[7:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_7x7_72(
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
    
    rr_6x6_73 M1(A_H, B_H, P1);
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
        
module rr_6x6_73(
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
    
    rr_5x5_74 M1(A_H, B_H, P1);
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
        
module rr_5x5_74(
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
    
    rr_4x4_75 M1(A_H, B_H, P1);
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
        
module rr_4x4_75(
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
        