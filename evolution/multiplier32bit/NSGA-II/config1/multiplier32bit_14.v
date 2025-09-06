
module multiplier32bit_14(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [25:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[31:6];
    assign B_H = B[31:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    
    wire [51:0] P1;
    wire [31:0] P2, P3;
    wire [11:0] P4;
    
    rr_26x26_1 M1(A_H, B_H, P1);
    NR_26_6 M2(A_H, B_L, P2);
    NR_6_26 M3(A_L, B_H, P3);
    rr_6x6_20 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[57:0] operand1;
    wire[32:0] operand2;
    wire[58:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder58_25 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[57:0],P4_L};
endmodule
        
module rr_26x26_1(
    input [25:0] A, 
    input [25:0] B, 
    output [51:0] P
);
    
    wire [24:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[25:1];
    assign B_H = B[25:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [49:0] P1;
    wire [24:0] P2, P3;
    wire [0:0] P4;
    
    rr_25x25_2 M1(A_H, B_H, P1);
    NR_25_1 M2(A_H, B_L, P2);
    NR_1_25 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[50:0] operand1;
    wire[25:0] operand2;
    wire[51:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder51_25 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[50:0],P4_L};
endmodule
        
module rr_25x25_2(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [16:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[24:8];
    assign B_H = B[24:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    wire [33:0] P1;
    wire [24:0] P2, P3;
    wire [15:0] P4;
    
    rr_17x17_3 M1(A_H, B_H, P1);
    NR_17_8 M2(A_H, B_L, P2);
    NR_8_17 M3(A_L, B_H, P3);
    NR_8_8 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[41:0] operand1;
    wire[25:0] operand2;
    wire[42:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder42_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[41:0],P4_L};
endmodule
        
module rr_17x17_3(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [15:0] A_L, B_L;
    
    assign A_H = A[16:16];
    assign B_H = B[16:16];
    assign A_L = A[15:0];
    assign B_L = B[15:0];
    
    wire [0:0] P1;
    wire [15:0] P2, P3;
    wire [31:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_16 M2(A_H, B_L, P2);
    NR_16_1 M3(A_L, B_H, P3);
    rr_16x16_7 M4(A_L, B_L, P4);
    
    wire[15:0] P4_L;
    wire[15:0] P4_H;

    wire[16:0] operand1;
    wire[16:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[15:0];
    assign P4_H = P4[31:16];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_16x16_7(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[15:2];
    assign B_H = B[15:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [27:0] P1;
    wire [15:0] P2, P3;
    wire [3:0] P4;
    
    NR_14_14 M1(A_H, B_H, P1);
    NR_14_2 M2(A_H, B_L, P2);
    NR_2_14 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[29:0] operand1;
    wire[16:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_6x6_20(
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
    rr_5x5_24 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_24(
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
        