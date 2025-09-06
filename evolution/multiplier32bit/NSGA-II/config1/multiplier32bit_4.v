
module multiplier32bit_4(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [17:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[31:14];
    assign B_H = B[31:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    
    wire [35:0] P1;
    wire [31:0] P2, P3;
    wire [27:0] P4;
    
    rr_18x18_1 M1(A_H, B_H, P1);
    NR_18_14 M2(A_H, B_L, P2);
    NR_14_18 M3(A_L, B_H, P3);
    rr_14x14_24 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[49:0] operand1;
    wire[32:0] operand2;
    wire[50:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder50_17 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[49:0],P4_L};
endmodule
        
module rr_18x18_1(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[17:10];
    assign B_H = B[17:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [15:0] P1;
    wire [17:0] P2, P3;
    wire [19:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_10 M2(A_H, B_L, P2);
    NR_10_8 M3(A_L, B_H, P3);
    rr_10x10_5 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[25:0] operand1;
    wire[18:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder18_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_10x10_5(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[9:3];
    assign B_H = B[9:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [13:0] P1;
    wire [9:0] P2, P3;
    wire [5:0] P4;
    
    rr_7x7_6 M1(A_H, B_H, P1);
    NR_7_3 M2(A_H, B_L, P2);
    NR_3_7 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[16:0] operand1;
    wire[10:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_7x7_6(
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
    
    rr_5x5_7 M1(A_H, B_H, P1);
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
        
module rr_5x5_7(
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
    rr_3x3_11 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_11(
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
    
    wire [0:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[11:11];
    assign B_H = B[11:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [0:0] P1;
    wire [10:0] P2, P3;
    wire [21:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_11 M2(A_H, B_L, P2);
    NR_11_1 M3(A_L, B_H, P3);
    rr_11x11_29 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[11:0] operand1;
    wire[11:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_11x11_29(
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
    
    NR_10_10 M1(A_H, B_H, P1);
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
        