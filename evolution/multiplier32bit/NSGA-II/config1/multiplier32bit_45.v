
module multiplier32bit_45(
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
    
    wire [2:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[30:28];
    assign B_H = B[30:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    wire [5:0] P1;
    wire [30:0] P2, P3;
    wire [55:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_28 M2(A_H, B_L, P2);
    NR_28_3 M3(A_L, B_H, P3);
    rr_28x28_8 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[33:0] operand1;
    wire[31:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder31_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_28x28_8(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [25:0] A_L, B_L;
    
    assign A_H = A[27:26];
    assign B_H = B[27:26];
    assign A_L = A[25:0];
    assign B_L = B[25:0];
    
    wire [3:0] P1;
    wire [27:0] P2, P3;
    wire [51:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_26 M2(A_H, B_L, P2);
    NR_26_2 M3(A_L, B_H, P3);
    rr_26x26_12 M4(A_L, B_L, P4);
    
    wire[25:0] P4_L;
    wire[25:0] P4_H;

    wire[29:0] operand1;
    wire[28:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[25:0];
    assign P4_H = P4[51:26];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_26x26_12(
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
    
    rr_25x25_13 M1(A_H, B_H, P1);
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
        
module rr_25x25_13(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [20:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[24:4];
    assign B_H = B[24:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [41:0] P1;
    wire [24:0] P2, P3;
    wire [7:0] P4;
    
    rr_21x21_14 M1(A_H, B_H, P1);
    NR_21_4 M2(A_H, B_L, P2);
    NR_4_21 M3(A_L, B_H, P3);
    rr_4x4_37 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[45:0] operand1;
    wire[25:0] operand2;
    wire[46:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder46_20 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[45:0],P4_L};
endmodule
        
module rr_21x21_14(
    input [20:0] A, 
    input [20:0] B, 
    output [41:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [19:0] A_L, B_L;
    
    assign A_H = A[20:20];
    assign B_H = B[20:20];
    assign A_L = A[19:0];
    assign B_L = B[19:0];
    
    wire [0:0] P1;
    wire [19:0] P2, P3;
    wire [39:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_20 M2(A_H, B_L, P2);
    NR_20_1 M3(A_L, B_H, P3);
    rr_20x20_18 M4(A_L, B_L, P4);
    
    wire[19:0] P4_L;
    wire[19:0] P4_H;

    wire[20:0] operand1;
    wire[20:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[19:0];
    assign P4_H = P4[39:20];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_20x20_18(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[19:7];
    assign B_H = B[19:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [25:0] P1;
    wire [19:0] P2, P3;
    wire [13:0] P4;
    
    NR_13_13 M1(A_H, B_H, P1);
    NR_13_7 M2(A_H, B_L, P2);
    NR_7_13 M3(A_L, B_H, P3);
    rr_7x7_22 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[32:0] operand1;
    wire[20:0] operand2;
    wire[33:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder33_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
endmodule
        
module rr_7x7_22(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[6:1];
    assign B_H = B[6:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [11:0] P1;
    wire [5:0] P2, P3;
    wire [0:0] P4;
    
    rr_6x6_23 M1(A_H, B_H, P1);
    NR_6_1 M2(A_H, B_L, P2);
    NR_1_6 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[12:0] operand1;
    wire[6:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_6x6_23(
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
    rr_4x4_27 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_27(
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
    rr_3x3_41 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_41(
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
        