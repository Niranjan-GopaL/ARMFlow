
module multiplier32bit_47(
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
    
    wire [22:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[30:8];
    assign B_H = B[30:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [45:0] P1;
    wire [30:0] P2, P3;
    wire [15:0] P4;
    
    rr_23x23_5 M1(A_H, B_H, P1);
    NR_23_8 M2(A_H, B_L, P2);
    NR_8_23 M3(A_L, B_H, P3);
    rr_8x8_36 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[53:0] operand1;
    wire[31:0] operand2;
    wire[54:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder31_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder54_22 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[53:0],P4_L};
endmodule
        
module rr_23x23_5(
    input [22:0] A, 
    input [22:0] B, 
    output [45:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[22:14];
    assign B_H = B[22:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    wire [17:0] P1;
    wire [22:0] P2, P3;
    wire [27:0] P4;
    
    rr_9x9_6 M1(A_H, B_H, P1);
    NR_9_14 M2(A_H, B_L, P2);
    NR_14_9 M3(A_L, B_H, P3);
    rr_14x14_13 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[31:0] operand1;
    wire[23:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder23_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[31:0],P4_L};
endmodule
        
module rr_9x9_6(
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
    NR_8_8 M4(A_L, B_L, P4);
    
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
        
module rr_14x14_13(
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
    
    rr_3x3_14 M1(A_H, B_H, P1);
    NR_3_11 M2(A_H, B_L, P2);
    NR_11_3 M3(A_L, B_H, P3);
    rr_11x11_21 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_14(
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
        
module rr_11x11_21(
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
    
    rr_4x4_22 M1(A_H, B_H, P1);
    NR_4_7 M2(A_H, B_L, P2);
    NR_7_4 M3(A_L, B_H, P3);
    rr_7x7_29 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_22(
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
        
module rr_7x7_29(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[6:4];
    assign B_H = B[6:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [5:0] P1;
    wire [6:0] P2, P3;
    wire [7:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_4 M2(A_H, B_L, P2);
    NR_4_3 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[9:0] operand1;
    wire[7:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_8x8_36(
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
    
    rr_4x4_37 M1(A_H, B_H, P1);
    rr_4x4_42 M2(A_H, B_L, P2);
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
        
module rr_4x4_37(
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
        
module rr_4x4_42(
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
        