
module multiplier32bit_41(
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
    rr_13x13_32 M4(A_L, B_L, P4);
    
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
    
    wire [9:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[18:9];
    assign B_H = B[18:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [19:0] P1;
    wire [18:0] P2, P3;
    wire [17:0] P4;
    
    rr_10x10_2 M1(A_H, B_H, P1);
    NR_10_9 M2(A_H, B_L, P2);
    NR_9_10 M3(A_L, B_H, P3);
    rr_9x9_25 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[28:0] operand1;
    wire[19:0] operand2;
    wire[29:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder19_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder29_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[28:0],P4_L};
endmodule
        
module rr_10x10_2(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[9:1];
    assign B_H = B[9:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [17:0] P1;
    wire [8:0] P2, P3;
    wire [0:0] P4;
    
    rr_9x9_3 M1(A_H, B_H, P1);
    NR_9_1 M2(A_H, B_L, P2);
    NR_1_9 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[18:0] operand1;
    wire[9:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_9x9_3(
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
    rr_8x8_7 M4(A_L, B_L, P4);
    
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
        
module rr_8x8_7(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[7:6];
    assign B_H = B[7:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [3:0] P1;
    wire [7:0] P2, P3;
    wire [11:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_6 M2(A_H, B_L, P2);
    NR_6_2 M3(A_L, B_H, P3);
    rr_6x6_11 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[9:0] operand1;
    wire[8:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_6x6_11(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[5:2];
    assign B_H = B[5:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [7:0] P1;
    wire [5:0] P2, P3;
    wire [3:0] P4;
    
    rr_4x4_12 M1(A_H, B_H, P1);
    NR_4_2 M2(A_H, B_L, P2);
    NR_2_4 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[9:0] operand1;
    wire[6:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_4x4_12(
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
        
module rr_9x9_25(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[8:7];
    assign B_H = B[8:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [3:0] P1;
    wire [8:0] P2, P3;
    wire [13:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_7 M2(A_H, B_L, P2);
    NR_7_2 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[10:0] operand1;
    wire[9:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_13x13_32(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[12:2];
    assign B_H = B[12:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [21:0] P1;
    wire [12:0] P2, P3;
    wire [3:0] P4;
    
    rr_11x11_33 M1(A_H, B_H, P1);
    NR_11_2 M2(A_H, B_L, P2);
    NR_2_11 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[23:0] operand1;
    wire[13:0] operand2;
    wire[24:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder24_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[23:0],P4_L};
endmodule
        
module rr_11x11_33(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[10:2];
    assign B_H = B[10:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [17:0] P1;
    wire [10:0] P2, P3;
    wire [3:0] P4;
    
    rr_9x9_34 M1(A_H, B_H, P1);
    NR_9_2 M2(A_H, B_L, P2);
    NR_2_9 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[19:0] operand1;
    wire[11:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_9x9_34(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[8:7];
    assign B_H = B[8:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [3:0] P1;
    wire [8:0] P2, P3;
    wire [13:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_7 M2(A_H, B_L, P2);
    NR_7_2 M3(A_L, B_H, P3);
    rr_7x7_38 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[10:0] operand1;
    wire[9:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_7x7_38(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[6:3];
    assign B_H = B[6:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [7:0] P1;
    wire [6:0] P2, P3;
    wire [5:0] P4;
    
    rr_4x4_39 M1(A_H, B_H, P1);
    NR_4_3 M2(A_H, B_L, P2);
    NR_3_4 M3(A_L, B_H, P3);
    rr_3x3_46 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[10:0] operand1;
    wire[7:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_4x4_39(
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
        
module rr_3x3_46(
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
        