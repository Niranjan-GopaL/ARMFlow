
module multiplier32bit_12(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [26:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[31:5];
    assign B_H = B[31:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    
    wire [53:0] P1;
    wire [31:0] P2, P3;
    wire [9:0] P4;
    
    rr_27x27_1 M1(A_H, B_H, P1);
    NR_27_5 M2(A_H, B_L, P2);
    NR_5_27 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[58:0] operand1;
    wire[32:0] operand2;
    wire[59:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder59_26 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[58:0],P4_L};
endmodule
        
module rr_27x27_1(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [18:0] A_L, B_L;
    
    assign A_H = A[26:19];
    assign B_H = B[26:19];
    assign A_L = A[18:0];
    assign B_L = B[18:0];
    
    wire [15:0] P1;
    wire [26:0] P2, P3;
    wire [37:0] P4;
    
    rr_8x8_2 M1(A_H, B_H, P1);
    NR_8_19 M2(A_H, B_L, P2);
    NR_19_8 M3(A_L, B_H, P3);
    rr_19x19_25 M4(A_L, B_L, P4);
    
    wire[18:0] P4_L;
    wire[18:0] P4_H;

    wire[34:0] operand1;
    wire[27:0] operand2;
    wire[35:0] out;
    
    assign P4_L = P4[18:0];
    assign P4_H = P4[37:19];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder35_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[34:0],P4_L};
endmodule
        
module rr_8x8_2(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[7:7];
    assign B_H = B[7:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [0:0] P1;
    wire [6:0] P2, P3;
    wire [13:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_7 M2(A_H, B_L, P2);
    NR_7_1 M3(A_L, B_H, P3);
    rr_7x7_6 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[7:0] operand1;
    wire[7:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_7x7_6(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[6:6];
    assign B_H = B[6:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [0:0] P1;
    wire [5:0] P2, P3;
    wire [11:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_6 M2(A_H, B_L, P2);
    NR_6_1 M3(A_L, B_H, P3);
    rr_6x6_10 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[6:0] operand1;
    wire[6:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_6x6_10(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[5:1];
    assign B_H = B[5:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [9:0] P1;
    wire [4:0] P2, P3;
    wire [0:0] P4;
    
    rr_5x5_11 M1(A_H, B_H, P1);
    NR_5_1 M2(A_H, B_L, P2);
    NR_1_5 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[10:0] operand1;
    wire[5:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_5x5_11(
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
    
    rr_3x3_12 M1(A_H, B_H, P1);
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
        
module rr_3x3_12(
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
        
module rr_19x19_25(
    input [18:0] A, 
    input [18:0] B, 
    output [37:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[18:6];
    assign B_H = B[18:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [25:0] P1;
    wire [18:0] P2, P3;
    wire [11:0] P4;
    
    rr_13x13_26 M1(A_H, B_H, P1);
    NR_13_6 M2(A_H, B_L, P2);
    NR_6_13 M3(A_L, B_H, P3);
    rr_6x6_45 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[31:0] operand1;
    wire[19:0] operand2;
    wire[32:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder32_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[31:0],P4_L};
endmodule
        
module rr_13x13_26(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[12:10];
    assign B_H = B[12:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [5:0] P1;
    wire [12:0] P2, P3;
    wire [19:0] P4;
    
    rr_3x3_27 M1(A_H, B_H, P1);
    NR_3_10 M2(A_H, B_L, P2);
    NR_10_3 M3(A_L, B_H, P3);
    rr_10x10_34 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[15:0] operand1;
    wire[13:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_3x3_27(
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
        
module rr_10x10_34(
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
    
    rr_5x5_35 M1(A_H, B_H, P1);
    NR_5_5 M2(A_H, B_L, P2);
    NR_5_5 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_35(
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
    NR_3_3 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_45(
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
        