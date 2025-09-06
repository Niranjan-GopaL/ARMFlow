
module multiplier32bit_46(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [18:0] A_H, B_H;
    wire [12:0] A_L, B_L;
    
    assign A_H = A[31:13];
    assign B_H = B[31:13];
    assign A_L = A[12:0];
    assign B_L = B[12:0];
    
    
    wire [37:0] P1;
    wire [31:0] P2, P3;
    wire [25:0] P4;
    
    rr_19x19_1 M1(A_H, B_H, P1);
    NR_19_13 M2(A_H, B_L, P2);
    NR_13_19 M3(A_L, B_H, P3);
    NR_13_13 M4(A_L, B_L, P4);
    
    wire[12:0] P4_L;
    wire[12:0] P4_H;

    wire[50:0] operand1;
    wire[32:0] operand2;
    wire[51:0] out;
    
    assign P4_L = P4[12:0];
    assign P4_H = P4[25:13];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder51_18 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[50:0],P4_L};
endmodule
        
module rr_19x19_1(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [16:0] A_L, B_L;
    
    assign A_H = A[18:17];
    assign B_H = B[18:17];
    assign A_L = A[16:0];
    assign B_L = B[16:0];
    
    wire [3:0] P1;
    wire [18:0] P2, P3;
    wire [33:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_17 M2(A_H, B_L, P2);
    NR_17_2 M3(A_L, B_H, P3);
    rr_17x17_5 M4(A_L, B_L, P4);
    
    wire[16:0] P4_L;
    wire[16:0] P4_H;

    wire[20:0] operand1;
    wire[19:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[16:0];
    assign P4_H = P4[33:17];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_17x17_5(
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
    
    NR_3_3 M1(A_H, B_H, P1);
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
        
module rr_14x14_9(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[13:1];
    assign B_H = B[13:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [25:0] P1;
    wire [12:0] P2, P3;
    wire [0:0] P4;
    
    rr_13x13_10 M1(A_H, B_H, P1);
    NR_13_1 M2(A_H, B_L, P2);
    NR_1_13 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[26:0] operand1;
    wire[13:0] operand2;
    wire[27:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder27_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[26:0],P4_L};
endmodule
        
module rr_13x13_10(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[12:11];
    assign B_H = B[12:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [3:0] P1;
    wire [12:0] P2, P3;
    wire [21:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_11 M2(A_H, B_L, P2);
    NR_11_2 M3(A_L, B_H, P3);
    rr_11x11_14 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[14:0] operand1;
    wire[13:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_11x11_14(
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
    
    rr_8x8_15 M1(A_H, B_H, P1);
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
        
module rr_8x8_15(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[7:5];
    assign B_H = B[7:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [5:0] P1;
    wire [7:0] P2, P3;
    wire [9:0] P4;
    
    rr_3x3_16 M1(A_H, B_H, P1);
    NR_3_5 M2(A_H, B_L, P2);
    NR_5_3 M3(A_L, B_H, P3);
    rr_5x5_23 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[10:0] operand1;
    wire[8:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_3x3_16(
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
        
module rr_5x5_23(
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
        