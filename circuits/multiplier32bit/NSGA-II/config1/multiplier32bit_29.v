
module multiplier32bit_29(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [16:0] A_L, B_L;
    
    assign A_H = A[31:17];
    assign B_H = B[31:17];
    assign A_L = A[16:0];
    assign B_L = B[16:0];
    
    
    wire [29:0] P1;
    wire [31:0] P2, P3;
    wire [33:0] P4;
    
    rr_15x15_1 M1(A_H, B_H, P1);
    NR_15_17 M2(A_H, B_L, P2);
    NR_17_15 M3(A_L, B_H, P3);
    rr_17x17_24 M4(A_L, B_L, P4);
    
    wire[16:0] P4_L;
    wire[16:0] P4_H;

    wire[46:0] operand1;
    wire[32:0] operand2;
    wire[47:0] out;
    
    assign P4_L = P4[16:0];
    assign P4_H = P4[33:17];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder47_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[46:0],P4_L};
endmodule
        
module rr_15x15_1(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[14:11];
    assign B_H = B[14:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [7:0] P1;
    wire [14:0] P2, P3;
    wire [21:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_11 M2(A_H, B_L, P2);
    NR_11_4 M3(A_L, B_H, P3);
    rr_11x11_5 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[18:0] operand1;
    wire[15:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        
module rr_11x11_5(
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
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_7 M2(A_H, B_L, P2);
    NR_7_4 M3(A_L, B_H, P3);
    rr_7x7_9 M4(A_L, B_L, P4);
    
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
        
module rr_7x7_9(
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
    
    rr_5x5_10 M1(A_H, B_H, P1);
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
        
module rr_5x5_10(
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
    rr_3x3_14 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_14(
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
        
module rr_17x17_24(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[16:10];
    assign B_H = B[16:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    wire [13:0] P1;
    wire [16:0] P2, P3;
    wire [19:0] P4;
    
    NR_7_7 M1(A_H, B_H, P1);
    NR_7_10 M2(A_H, B_L, P2);
    NR_10_7 M3(A_L, B_H, P3);
    rr_10x10_28 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[23:0] operand1;
    wire[17:0] operand2;
    wire[24:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder24_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[23:0],P4_L};
endmodule
        
module rr_10x10_28(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[9:7];
    assign B_H = B[9:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [5:0] P1;
    wire [9:0] P2, P3;
    wire [13:0] P4;
    
    rr_3x3_29 M1(A_H, B_H, P1);
    NR_3_7 M2(A_H, B_L, P2);
    NR_7_3 M3(A_L, B_H, P3);
    rr_7x7_36 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[12:0] operand1;
    wire[10:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_3x3_29(
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
        
module rr_7x7_36(
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
    rr_6x6_40 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_40(
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
    
    rr_5x5_41 M1(A_H, B_H, P1);
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
        
module rr_5x5_41(
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
    rr_3x3_45 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_45(
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
        