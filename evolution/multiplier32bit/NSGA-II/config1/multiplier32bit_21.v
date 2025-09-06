
module multiplier32bit_21(
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
    rr_15x15_28 M4(A_L, B_L, P4);
    
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
    
    wire [15:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[16:1];
    assign B_H = B[16:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [31:0] P1;
    wire [15:0] P2, P3;
    wire [0:0] P4;
    
    rr_16x16_2 M1(A_H, B_H, P1);
    NR_16_1 M2(A_H, B_L, P2);
    NR_1_16 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[32:0] operand1;
    wire[16:0] operand2;
    wire[33:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder33_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
endmodule
        
module rr_16x16_2(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[15:5];
    assign B_H = B[15:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [21:0] P1;
    wire [15:0] P2, P3;
    wire [9:0] P4;
    
    rr_11x11_3 M1(A_H, B_H, P1);
    NR_11_5 M2(A_H, B_L, P2);
    NR_5_11 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[26:0] operand1;
    wire[16:0] operand2;
    wire[27:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder27_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[26:0],P4_L};
endmodule
        
module rr_11x11_3(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[10:7];
    assign B_H = B[10:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [7:0] P1;
    wire [10:0] P2, P3;
    wire [13:0] P4;
    
    rr_4x4_4 M1(A_H, B_H, P1);
    NR_4_7 M2(A_H, B_L, P2);
    NR_7_4 M3(A_L, B_H, P3);
    rr_7x7_11 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[14:0] operand1;
    wire[11:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_4x4_4(
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
        
module rr_7x7_11(
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
    rr_5x5_15 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_15(
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
    
    NR_4_4 M1(A_H, B_H, P1);
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
        
module rr_15x15_28(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[14:11];
    assign B_H = B[14:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [7:0] P1;
    wire [14:0] P2, P3;
    wire [21:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_11 M2(A_H, B_L, P2);
    NR_11_4 M3(A_L, B_H, P3);
    rr_11x11_32 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[18:0] operand1;
    wire[15:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_11x11_32(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[10:8];
    assign B_H = B[10:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [5:0] P1;
    wire [10:0] P2, P3;
    wire [15:0] P4;
    
    rr_3x3_33 M1(A_H, B_H, P1);
    NR_3_8 M2(A_H, B_L, P2);
    NR_8_3 M3(A_L, B_H, P3);
    rr_8x8_40 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[13:0] operand1;
    wire[11:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_3x3_33(
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
        
module rr_8x8_40(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[7:1];
    assign B_H = B[7:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [13:0] P1;
    wire [6:0] P2, P3;
    wire [0:0] P4;
    
    rr_7x7_41 M1(A_H, B_H, P1);
    NR_7_1 M2(A_H, B_L, P2);
    NR_1_7 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[14:0] operand1;
    wire[7:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_7x7_41(
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
    
    rr_5x5_42 M1(A_H, B_H, P1);
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
    rr_3x3_46 M4(A_L, B_L, P4);
    
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
        