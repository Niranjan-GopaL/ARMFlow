
module multiplier32bit_0(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [22:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[31:9];
    assign B_H = B[31:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    
    wire [45:0] P1;
    wire [31:0] P2, P3;
    wire [17:0] P4;
    
    rr_23x23_1 M1(A_H, B_H, P1);
    NR_23_9 M2(A_H, B_L, P2);
    NR_9_23 M3(A_L, B_H, P3);
    rr_9x9_16 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[54:0] operand1;
    wire[32:0] operand2;
    wire[55:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder55_22 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[54:0],P4_L};
endmodule
        
module rr_23x23_1(
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
    
    rr_9x9_2 M1(A_H, B_H, P1);
    NR_9_14 M2(A_H, B_L, P2);
    NR_14_9 M3(A_L, B_H, P3);
    rr_14x14_9 M4(A_L, B_L, P4);
    
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
        
module rr_9x9_2(
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
        
module rr_14x14_9(
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
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_11 M2(A_H, B_L, P2);
    NR_11_3 M3(A_L, B_H, P3);
    NR_11_11 M4(A_L, B_L, P4);
    
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
        
module rr_9x9_16(
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
    rr_8x8_20 M4(A_L, B_L, P4);
    
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
        
module rr_8x8_20(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[7:3];
    assign B_H = B[7:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [9:0] P1;
    wire [7:0] P2, P3;
    wire [5:0] P4;
    
    rr_5x5_21 M1(A_H, B_H, P1);
    NR_5_3 M2(A_H, B_L, P2);
    NR_3_5 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[12:0] operand1;
    wire[8:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_5x5_21(
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
    
    rr_3x3_22 M1(A_H, B_H, P1);
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
        
module rr_3x3_22(
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
        