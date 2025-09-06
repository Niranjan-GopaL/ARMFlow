
module multiplier32bit_13(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [16:0] A_H, B_H;
    wire [14:0] A_L, B_L;
    
    assign A_H = A[31:15];
    assign B_H = B[31:15];
    assign A_L = A[14:0];
    assign B_L = B[14:0];
    
    
    wire [33:0] P1;
    wire [31:0] P2, P3;
    wire [29:0] P4;
    
    rr_17x17_1 M1(A_H, B_H, P1);
    NR_17_15 M2(A_H, B_L, P2);
    NR_15_17 M3(A_L, B_H, P3);
    rr_15x15_32 M4(A_L, B_L, P4);
    
    wire[14:0] P4_L;
    wire[14:0] P4_H;

    wire[48:0] operand1;
    wire[32:0] operand2;
    wire[49:0] out;
    
    assign P4_L = P4[14:0];
    assign P4_H = P4[29:15];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder49_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[48:0],P4_L};
endmodule
        
module rr_17x17_1(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[16:14];
    assign B_H = B[16:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    wire [5:0] P1;
    wire [16:0] P2, P3;
    wire [27:0] P4;
    
    rr_3x3_2 M1(A_H, B_H, P1);
    NR_3_14 M2(A_H, B_L, P2);
    NR_14_3 M3(A_L, B_H, P3);
    rr_14x14_9 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[19:0] operand1;
    wire[17:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
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
        
module rr_14x14_9(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[13:3];
    assign B_H = B[13:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [21:0] P1;
    wire [13:0] P2, P3;
    wire [5:0] P4;
    
    rr_11x11_10 M1(A_H, B_H, P1);
    NR_11_3 M2(A_H, B_L, P2);
    NR_3_11 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[24:0] operand1;
    wire[14:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_11x11_10(
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
    
    rr_8x8_11 M1(A_H, B_H, P1);
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
        
module rr_8x8_11(
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
    rr_6x6_15 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_15(
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
    rr_4x4_19 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_19(
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
        
module rr_15x15_32(
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
    rr_13x13_36 M4(A_L, B_L, P4);
    
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
        
module rr_13x13_36(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[12:10];
    assign B_H = B[12:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [5:0] P1;
    wire [12:0] P2, P3;
    wire [19:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_10 M2(A_H, B_L, P2);
    NR_10_3 M3(A_L, B_H, P3);
    rr_10x10_40 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[15:0] operand1;
    wire[13:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_10x10_40(
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
    
    NR_5_5 M1(A_H, B_H, P1);
    rr_5x5_42 M2(A_H, B_L, P2);
    rr_5x5_47 M3(A_L, B_H, P3);
    rr_5x5_52 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_42(
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
        
module rr_5x5_47(
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
        
module rr_5x5_52(
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
        