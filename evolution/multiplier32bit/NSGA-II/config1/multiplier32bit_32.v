
module multiplier32bit_32(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [25:0] A_L, B_L;
    
    assign A_H = A[31:26];
    assign B_H = B[31:26];
    assign A_L = A[25:0];
    assign B_L = B[25:0];
    
    
    wire [11:0] P1;
    wire [31:0] P2, P3;
    wire [51:0] P4;
    
    rr_6x6_1 M1(A_H, B_H, P1);
    NR_6_26 M2(A_H, B_L, P2);
    NR_26_6 M3(A_L, B_H, P3);
    rr_26x26_20 M4(A_L, B_L, P4);
    
    wire[25:0] P4_L;
    wire[25:0] P4_H;

    wire[37:0] operand1;
    wire[32:0] operand2;
    wire[38:0] out;
    
    assign P4_L = P4[25:0];
    assign P4_H = P4[51:26];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder38_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[37:0],P4_L};
endmodule
        
module rr_6x6_1(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[5:5];
    assign B_H = B[5:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [0:0] P1;
    wire [4:0] P2, P3;
    wire [9:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_5 M2(A_H, B_L, P2);
    NR_5_1 M3(A_L, B_H, P3);
    rr_5x5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[5:0] operand1;
    wire[5:0] operand2;
    wire[6:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder6_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[6:0],P4_L};
endmodule
        
module rr_5x5_5(
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
    rr_4x4_9 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_9(
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
    
    rr_3x3_10 M1(A_H, B_H, P1);
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
        
module rr_3x3_10(
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
        
module rr_26x26_20(
    input [25:0] A, 
    input [25:0] B, 
    output [51:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [19:0] A_L, B_L;
    
    assign A_H = A[25:20];
    assign B_H = B[25:20];
    assign A_L = A[19:0];
    assign B_L = B[19:0];
    
    wire [11:0] P1;
    wire [25:0] P2, P3;
    wire [39:0] P4;
    
    NR_6_6 M1(A_H, B_H, P1);
    NR_6_20 M2(A_H, B_L, P2);
    NR_20_6 M3(A_L, B_H, P3);
    rr_20x20_24 M4(A_L, B_L, P4);
    
    wire[19:0] P4_L;
    wire[19:0] P4_H;

    wire[31:0] operand1;
    wire[26:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[19:0];
    assign P4_H = P4[39:20];
    assign operand1 = {P1,P4_H};

    customAdder26_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[31:0],P4_L};
endmodule
        
module rr_20x20_24(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[19:10];
    assign B_H = B[19:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [19:0] P1;
    wire [19:0] P2, P3;
    wire [19:0] P4;
    
    rr_10x10_25 M1(A_H, B_H, P1);
    rr_10x10_58 M2(A_H, B_L, P2);
    NR_10_10 M3(A_L, B_H, P3);
    rr_10x10_64 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[29:0] operand1;
    wire[20:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_10x10_25(
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
    
    rr_5x5_26 M1(A_H, B_H, P1);
    NR_5_5 M2(A_H, B_L, P2);
    rr_5x5_40 M3(A_L, B_H, P3);
    rr_5x5_53 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_26(
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
    
    rr_4x4_27 M1(A_H, B_H, P1);
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
        
module rr_4x4_27(
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
    rr_3x3_31 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_40(
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
    
    rr_4x4_41 M1(A_H, B_H, P1);
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
        
module rr_4x4_41(
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
    
    rr_3x3_42 M1(A_H, B_H, P1);
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
        
module rr_3x3_42(
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
        
module rr_5x5_53(
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
        
module rr_10x10_58(
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
    
    NR_6_6 M1(A_H, B_H, P1);
    NR_6_4 M2(A_H, B_L, P2);
    NR_4_6 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
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
        
module rr_10x10_64(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[9:2];
    assign B_H = B[9:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [15:0] P1;
    wire [9:0] P2, P3;
    wire [3:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_2 M2(A_H, B_L, P2);
    NR_2_8 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[17:0] operand1;
    wire[10:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        