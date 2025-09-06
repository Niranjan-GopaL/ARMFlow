
module multiplier32bit_18(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [22:0] A_L, B_L;
    
    assign A_H = A[31:23];
    assign B_H = B[31:23];
    assign A_L = A[22:0];
    assign B_L = B[22:0];
    
    
    wire [17:0] P1;
    wire [31:0] P2, P3;
    wire [45:0] P4;
    
    rr_9x9_1 M1(A_H, B_H, P1);
    NR_9_23 M2(A_H, B_L, P2);
    NR_23_9 M3(A_L, B_H, P3);
    rr_23x23_12 M4(A_L, B_L, P4);
    
    wire[22:0] P4_L;
    wire[22:0] P4_H;

    wire[40:0] operand1;
    wire[32:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[22:0];
    assign P4_H = P4[45:23];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_9x9_1(
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
    rr_8x8_5 M4(A_L, B_L, P4);
    
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
        
module rr_8x8_5(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[7:4];
    assign B_H = B[7:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [7:0] P1;
    wire [7:0] P2, P3;
    wire [7:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_4 M2(A_H, B_L, P2);
    NR_4_4 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[11:0] operand1;
    wire[8:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_23x23_12(
    input [22:0] A, 
    input [22:0] B, 
    output [45:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [17:0] A_L, B_L;
    
    assign A_H = A[22:18];
    assign B_H = B[22:18];
    assign A_L = A[17:0];
    assign B_L = B[17:0];
    
    wire [9:0] P1;
    wire [22:0] P2, P3;
    wire [35:0] P4;
    
    rr_5x5_13 M1(A_H, B_H, P1);
    NR_5_18 M2(A_H, B_L, P2);
    NR_18_5 M3(A_L, B_H, P3);
    rr_18x18_20 M4(A_L, B_L, P4);
    
    wire[17:0] P4_L;
    wire[17:0] P4_H;

    wire[27:0] operand1;
    wire[23:0] operand2;
    wire[28:0] out;
    
    assign P4_L = P4[17:0];
    assign P4_H = P4[35:18];
    assign operand1 = {P1,P4_H};

    customAdder23_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder28_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[27:0],P4_L};
endmodule
        
module rr_5x5_13(
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
        
module rr_18x18_20(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[17:14];
    assign B_H = B[17:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    wire [7:0] P1;
    wire [17:0] P2, P3;
    wire [27:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_14 M2(A_H, B_L, P2);
    NR_14_4 M3(A_L, B_H, P3);
    rr_14x14_24 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[21:0] operand1;
    wire[18:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder18_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_14x14_24(
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
    
    rr_12x12_25 M1(A_H, B_H, P1);
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
        
module rr_12x12_25(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[11:7];
    assign B_H = B[11:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [9:0] P1;
    wire [11:0] P2, P3;
    wire [13:0] P4;
    
    rr_5x5_26 M1(A_H, B_H, P1);
    NR_5_7 M2(A_H, B_L, P2);
    NR_7_5 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[16:0] operand1;
    wire[12:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_5x5_26(
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
    rr_3x3_30 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_30(
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
        