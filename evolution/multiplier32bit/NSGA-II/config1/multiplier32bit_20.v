
module multiplier32bit_20(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [29:0] A_L, B_L;
    
    assign A_H = A[31:30];
    assign B_H = B[31:30];
    assign A_L = A[29:0];
    assign B_L = B[29:0];
    
    
    wire [3:0] P1;
    wire [31:0] P2, P3;
    wire [59:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_30 M2(A_H, B_L, P2);
    NR_30_2 M3(A_L, B_H, P3);
    rr_30x30_4 M4(A_L, B_L, P4);
    
    wire[29:0] P4_L;
    wire[29:0] P4_H;

    wire[33:0] operand1;
    wire[32:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[29:0];
    assign P4_H = P4[59:30];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_30x30_4(
    input [29:0] A, 
    input [29:0] B, 
    output [59:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [20:0] A_L, B_L;
    
    assign A_H = A[29:21];
    assign B_H = B[29:21];
    assign A_L = A[20:0];
    assign B_L = B[20:0];
    
    wire [17:0] P1;
    wire [29:0] P2, P3;
    wire [41:0] P4;
    
    rr_9x9_5 M1(A_H, B_H, P1);
    NR_9_21 M2(A_H, B_L, P2);
    NR_21_9 M3(A_L, B_H, P3);
    rr_21x21_28 M4(A_L, B_L, P4);
    
    wire[20:0] P4_L;
    wire[20:0] P4_H;

    wire[38:0] operand1;
    wire[30:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[20:0];
    assign P4_H = P4[41:21];
    assign operand1 = {P1,P4_H};

    customAdder30_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        
module rr_9x9_5(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[8:6];
    assign B_H = B[8:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [5:0] P1;
    wire [8:0] P2, P3;
    wire [11:0] P4;
    
    rr_3x3_6 M1(A_H, B_H, P1);
    NR_3_6 M2(A_H, B_L, P2);
    NR_6_3 M3(A_L, B_H, P3);
    rr_6x6_13 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[11:0] operand1;
    wire[9:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_3x3_6(
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
        
module rr_6x6_13(
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
    
    rr_4x4_14 M1(A_H, B_H, P1);
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
        
module rr_4x4_14(
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
    
    rr_3x3_15 M1(A_H, B_H, P1);
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
        
module rr_3x3_15(
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
        
module rr_21x21_28(
    input [20:0] A, 
    input [20:0] B, 
    output [41:0] P
);
    
    wire [19:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[20:1];
    assign B_H = B[20:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [39:0] P1;
    wire [19:0] P2, P3;
    wire [0:0] P4;
    
    rr_20x20_29 M1(A_H, B_H, P1);
    NR_20_1 M2(A_H, B_L, P2);
    NR_1_20 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[40:0] operand1;
    wire[20:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_20 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_20x20_29(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [16:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[19:3];
    assign B_H = B[19:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [33:0] P1;
    wire [19:0] P2, P3;
    wire [5:0] P4;
    
    rr_17x17_30 M1(A_H, B_H, P1);
    NR_17_3 M2(A_H, B_L, P2);
    NR_3_17 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[36:0] operand1;
    wire[20:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_17x17_30(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [14:0] A_L, B_L;
    
    assign A_H = A[16:15];
    assign B_H = B[16:15];
    assign A_L = A[14:0];
    assign B_L = B[14:0];
    
    wire [3:0] P1;
    wire [16:0] P2, P3;
    wire [29:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_15 M2(A_H, B_L, P2);
    NR_15_2 M3(A_L, B_H, P3);
    rr_15x15_34 M4(A_L, B_L, P4);
    
    wire[14:0] P4_L;
    wire[14:0] P4_H;

    wire[18:0] operand1;
    wire[17:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[14:0];
    assign P4_H = P4[29:15];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_15x15_34(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[14:2];
    assign B_H = B[14:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [25:0] P1;
    wire [14:0] P2, P3;
    wire [3:0] P4;
    
    rr_13x13_35 M1(A_H, B_H, P1);
    NR_13_2 M2(A_H, B_L, P2);
    NR_2_13 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[27:0] operand1;
    wire[15:0] operand2;
    wire[28:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder28_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[27:0],P4_L};
endmodule
        
module rr_13x13_35(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[12:9];
    assign B_H = B[12:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [7:0] P1;
    wire [12:0] P2, P3;
    wire [17:0] P4;
    
    rr_4x4_36 M1(A_H, B_H, P1);
    NR_4_9 M2(A_H, B_L, P2);
    NR_9_4 M3(A_L, B_H, P3);
    rr_9x9_43 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[16:0] operand1;
    wire[13:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_4x4_36(
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
        
module rr_9x9_43(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[8:2];
    assign B_H = B[8:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [13:0] P1;
    wire [8:0] P2, P3;
    wire [3:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_2 M2(A_H, B_L, P2);
    NR_2_7 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[15:0] operand1;
    wire[9:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        