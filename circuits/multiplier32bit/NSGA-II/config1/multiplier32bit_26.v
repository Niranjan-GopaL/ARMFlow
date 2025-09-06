
module multiplier32bit_26(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[31:28];
    assign B_H = B[31:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    
    wire [7:0] P1;
    wire [31:0] P2, P3;
    wire [55:0] P4;
    
    rr_4x4_1 M1(A_H, B_H, P1);
    NR_4_28 M2(A_H, B_L, P2);
    NR_28_4 M3(A_L, B_H, P3);
    rr_28x28_8 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[35:0] operand1;
    wire[32:0] operand2;
    wire[36:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder36_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[35:0],P4_L};
endmodule
        
module rr_4x4_1(
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
        
module rr_28x28_8(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [21:0] A_L, B_L;
    
    assign A_H = A[27:22];
    assign B_H = B[27:22];
    assign A_L = A[21:0];
    assign B_L = B[21:0];
    
    wire [11:0] P1;
    wire [27:0] P2, P3;
    wire [43:0] P4;
    
    rr_6x6_9 M1(A_H, B_H, P1);
    NR_6_22 M2(A_H, B_L, P2);
    NR_22_6 M3(A_L, B_H, P3);
    rr_22x22_16 M4(A_L, B_L, P4);
    
    wire[21:0] P4_L;
    wire[21:0] P4_H;

    wire[33:0] operand1;
    wire[28:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[21:0];
    assign P4_H = P4[43:22];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_6x6_9(
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
    NR_5_5 M4(A_L, B_L, P4);
    
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
        
module rr_22x22_16(
    input [21:0] A, 
    input [21:0] B, 
    output [43:0] P
);
    
    wire [18:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[21:3];
    assign B_H = B[21:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [37:0] P1;
    wire [21:0] P2, P3;
    wire [5:0] P4;
    
    rr_19x19_17 M1(A_H, B_H, P1);
    NR_19_3 M2(A_H, B_L, P2);
    NR_3_19 M3(A_L, B_H, P3);
    rr_3x3_28 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[40:0] operand1;
    wire[22:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder22_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_18 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_19x19_17(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[18:4];
    assign B_H = B[18:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [29:0] P1;
    wire [18:0] P2, P3;
    wire [7:0] P4;
    
    NR_15_15 M1(A_H, B_H, P1);
    NR_15_4 M2(A_H, B_L, P2);
    NR_4_15 M3(A_L, B_H, P3);
    rr_4x4_21 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[33:0] operand1;
    wire[19:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_4x4_21(
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
    
    NR_3_3 M1(A_H, B_H, P1);
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
        
module rr_3x3_28(
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
        