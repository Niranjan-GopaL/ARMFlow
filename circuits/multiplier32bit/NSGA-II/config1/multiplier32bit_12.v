
module multiplier32bit_12(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [28:0] A_L, B_L;
    
    assign A_H = A[31:29];
    assign B_H = B[31:29];
    assign A_L = A[28:0];
    assign B_L = B[28:0];
    
    
    wire [5:0] P1;
    wire [31:0] P2, P3;
    wire [57:0] P4;
    
    rr_3x3_1 M1(A_H, B_H, P1);
    NR_3_29 M2(A_H, B_L, P2);
    NR_29_3 M3(A_L, B_H, P3);
    rr_29x29_8 M4(A_L, B_L, P4);
    
    wire[28:0] P4_L;
    wire[28:0] P4_H;

    wire[34:0] operand1;
    wire[32:0] operand2;
    wire[35:0] out;
    
    assign P4_L = P4[28:0];
    assign P4_H = P4[57:29];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder35_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[34:0],P4_L};
endmodule
        
module rr_3x3_1(
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
        
module rr_29x29_8(
    input [28:0] A, 
    input [28:0] B, 
    output [57:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [23:0] A_L, B_L;
    
    assign A_H = A[28:24];
    assign B_H = B[28:24];
    assign A_L = A[23:0];
    assign B_L = B[23:0];
    
    wire [9:0] P1;
    wire [28:0] P2, P3;
    wire [47:0] P4;
    
    rr_5x5_9 M1(A_H, B_H, P1);
    NR_5_24 M2(A_H, B_L, P2);
    NR_24_5 M3(A_L, B_H, P3);
    rr_24x24_20 M4(A_L, B_L, P4);
    
    wire[23:0] P4_L;
    wire[23:0] P4_H;

    wire[33:0] operand1;
    wire[29:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[23:0];
    assign P4_H = P4[47:24];
    assign operand1 = {P1,P4_H};

    customAdder29_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_5x5_9(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[4:1];
    assign B_H = B[4:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [7:0] P1;
    wire [3:0] P2, P3;
    wire [0:0] P4;
    
    rr_4x4_10 M1(A_H, B_H, P1);
    NR_4_1 M2(A_H, B_L, P2);
    NR_1_4 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[8:0] operand1;
    wire[4:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_4x4_10(
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
        
module rr_24x24_20(
    input [23:0] A, 
    input [23:0] B, 
    output [47:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [20:0] A_L, B_L;
    
    assign A_H = A[23:21];
    assign B_H = B[23:21];
    assign A_L = A[20:0];
    assign B_L = B[20:0];
    
    wire [5:0] P1;
    wire [23:0] P2, P3;
    wire [41:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_21 M2(A_H, B_L, P2);
    NR_21_3 M3(A_L, B_H, P3);
    rr_21x21_24 M4(A_L, B_L, P4);
    
    wire[20:0] P4_L;
    wire[20:0] P4_H;

    wire[26:0] operand1;
    wire[24:0] operand2;
    wire[27:0] out;
    
    assign P4_L = P4[20:0];
    assign P4_H = P4[41:21];
    assign operand1 = {P1,P4_H};

    customAdder24_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder27_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[26:0],P4_L};
endmodule
        
module rr_21x21_24(
    input [20:0] A, 
    input [20:0] B, 
    output [41:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[20:6];
    assign B_H = B[20:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [29:0] P1;
    wire [20:0] P2, P3;
    wire [11:0] P4;
    
    rr_15x15_25 M1(A_H, B_H, P1);
    NR_15_6 M2(A_H, B_L, P2);
    NR_6_15 M3(A_L, B_H, P3);
    rr_6x6_48 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[35:0] operand1;
    wire[21:0] operand2;
    wire[36:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder21_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder36_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[35:0],P4_L};
endmodule
        
module rr_15x15_25(
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
    
    rr_13x13_26 M1(A_H, B_H, P1);
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
        
module rr_13x13_26(
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
    
    rr_11x11_27 M1(A_H, B_H, P1);
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
        
module rr_11x11_27(
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
    
    rr_9x9_28 M1(A_H, B_H, P1);
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
        
module rr_9x9_28(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[8:4];
    assign B_H = B[8:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [9:0] P1;
    wire [8:0] P2, P3;
    wire [7:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_4 M2(A_H, B_L, P2);
    NR_4_5 M3(A_L, B_H, P3);
    rr_4x4_32 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[13:0] operand1;
    wire[9:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_4x4_32(
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
        
module rr_6x6_48(
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
    rr_5x5_52 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_52(
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
        