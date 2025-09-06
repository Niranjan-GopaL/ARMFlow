
module multiplier32bit_49(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [26:0] A_L, B_L;
    
    assign A_H = A[31:27];
    assign B_H = B[31:27];
    assign A_L = A[26:0];
    assign B_L = B[26:0];
    
    
    wire [9:0] P1;
    wire [31:0] P2, P3;
    wire [53:0] P4;
    
    rr_5x5_1 M1(A_H, B_H, P1);
    NR_5_27 M2(A_H, B_L, P2);
    NR_27_5 M3(A_L, B_H, P3);
    rr_27x27_8 M4(A_L, B_L, P4);
    
    wire[26:0] P4_L;
    wire[26:0] P4_H;

    wire[36:0] operand1;
    wire[32:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[26:0];
    assign P4_H = P4[53:27];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_5x5_1(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[4:3];
    assign B_H = B[4:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [3:0] P1;
    wire [4:0] P2, P3;
    wire [5:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_3 M2(A_H, B_L, P2);
    NR_3_2 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[6:0] operand1;
    wire[5:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[6:0],P4_L};
endmodule
        
module rr_27x27_8(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [18:0] A_L, B_L;
    
    assign A_H = A[26:19];
    assign B_H = B[26:19];
    assign A_L = A[18:0];
    assign B_L = B[18:0];
    
    wire [15:0] P1;
    wire [26:0] P2, P3;
    wire [37:0] P4;
    
    rr_8x8_9 M1(A_H, B_H, P1);
    NR_8_19 M2(A_H, B_L, P2);
    NR_19_8 M3(A_L, B_H, P3);
    rr_19x19_24 M4(A_L, B_L, P4);
    
    wire[18:0] P4_L;
    wire[18:0] P4_H;

    wire[34:0] operand1;
    wire[27:0] operand2;
    wire[35:0] out;
    
    assign P4_L = P4[18:0];
    assign P4_H = P4[37:19];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder35_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[34:0],P4_L};
endmodule
        
module rr_8x8_9(
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
    
    rr_6x6_10 M1(A_H, B_H, P1);
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
        
module rr_6x6_10(
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
    
    rr_3x3_11 M1(A_H, B_H, P1);
    NR_3_3 M2(A_H, B_L, P2);
    NR_3_3 M3(A_L, B_H, P3);
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
        
module rr_3x3_11(
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
        
module rr_19x19_24(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[18:7];
    assign B_H = B[18:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [23:0] P1;
    wire [18:0] P2, P3;
    wire [13:0] P4;
    
    rr_12x12_25 M1(A_H, B_H, P1);
    NR_12_7 M2(A_H, B_L, P2);
    NR_7_12 M3(A_L, B_H, P3);
    rr_7x7_40 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[30:0] operand1;
    wire[19:0] operand2;
    wire[31:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder31_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[30:0],P4_L};
endmodule
        
module rr_12x12_25(
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
    rr_9x9_29 M4(A_L, B_L, P4);
    
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
        
module rr_9x9_29(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[8:5];
    assign B_H = B[8:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [7:0] P1;
    wire [8:0] P2, P3;
    wire [9:0] P4;
    
    rr_4x4_30 M1(A_H, B_H, P1);
    NR_4_5 M2(A_H, B_L, P2);
    NR_5_4 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[12:0] operand1;
    wire[9:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_4x4_30(
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
        
module rr_7x7_40(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[6:5];
    assign B_H = B[6:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [3:0] P1;
    wire [6:0] P2, P3;
    wire [9:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_5 M2(A_H, B_L, P2);
    NR_5_2 M3(A_L, B_H, P3);
    rr_5x5_44 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[8:0] operand1;
    wire[7:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_5x5_44(
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
    
    rr_4x4_45 M1(A_H, B_H, P1);
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
        
module rr_4x4_45(
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
        