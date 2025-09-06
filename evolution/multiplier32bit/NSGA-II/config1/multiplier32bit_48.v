
module multiplier32bit_48(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [28:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[31:3];
    assign B_H = B[31:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    
    wire [57:0] P1;
    wire [31:0] P2, P3;
    wire [5:0] P4;
    
    rr_29x29_1 M1(A_H, B_H, P1);
    NR_29_3 M2(A_H, B_L, P2);
    NR_3_29 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[60:0] operand1;
    wire[32:0] operand2;
    wire[61:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder61_28 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[60:0],P4_L};
endmodule
        
module rr_29x29_1(
    input [28:0] A, 
    input [28:0] B, 
    output [57:0] P
);
    
    wire [24:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[28:4];
    assign B_H = B[28:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [49:0] P1;
    wire [28:0] P2, P3;
    wire [7:0] P4;
    
    rr_25x25_2 M1(A_H, B_H, P1);
    NR_25_4 M2(A_H, B_L, P2);
    NR_4_25 M3(A_L, B_H, P3);
    rr_4x4_57 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[53:0] operand1;
    wire[29:0] operand2;
    wire[54:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder29_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder54_24 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[53:0],P4_L};
endmodule
        
module rr_25x25_2(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [23:0] A_L, B_L;
    
    assign A_H = A[24:24];
    assign B_H = B[24:24];
    assign A_L = A[23:0];
    assign B_L = B[23:0];
    
    wire [0:0] P1;
    wire [23:0] P2, P3;
    wire [47:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_24 M2(A_H, B_L, P2);
    NR_24_1 M3(A_L, B_H, P3);
    rr_24x24_6 M4(A_L, B_L, P4);
    
    wire[23:0] P4_L;
    wire[23:0] P4_H;

    wire[24:0] operand1;
    wire[24:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[23:0];
    assign P4_H = P4[47:24];
    assign operand1 = {P1,P4_H};

    customAdder24_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_24x24_6(
    input [23:0] A, 
    input [23:0] B, 
    output [47:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[23:9];
    assign B_H = B[23:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [29:0] P1;
    wire [23:0] P2, P3;
    wire [17:0] P4;
    
    rr_15x15_7 M1(A_H, B_H, P1);
    NR_15_9 M2(A_H, B_L, P2);
    NR_9_15 M3(A_L, B_H, P3);
    rr_9x9_46 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[38:0] operand1;
    wire[24:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder24_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        
module rr_15x15_7(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [12:0] A_L, B_L;
    
    assign A_H = A[14:13];
    assign B_H = B[14:13];
    assign A_L = A[12:0];
    assign B_L = B[12:0];
    
    wire [3:0] P1;
    wire [14:0] P2, P3;
    wire [25:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_13 M2(A_H, B_L, P2);
    NR_13_2 M3(A_L, B_H, P3);
    rr_13x13_11 M4(A_L, B_L, P4);
    
    wire[12:0] P4_L;
    wire[12:0] P4_H;

    wire[16:0] operand1;
    wire[15:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[12:0];
    assign P4_H = P4[25:13];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        
module rr_13x13_11(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[12:3];
    assign B_H = B[12:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [19:0] P1;
    wire [12:0] P2, P3;
    wire [5:0] P4;
    
    rr_10x10_12 M1(A_H, B_H, P1);
    NR_10_3 M2(A_H, B_L, P2);
    NR_3_10 M3(A_L, B_H, P3);
    rr_3x3_39 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[22:0] operand1;
    wire[13:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_10x10_12(
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
    
    rr_7x7_13 M1(A_H, B_H, P1);
    NR_7_3 M2(A_H, B_L, P2);
    NR_3_7 M3(A_L, B_H, P3);
    rr_3x3_32 M4(A_L, B_L, P4);
    
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
        
module rr_7x7_13(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[6:5];
    assign B_H = B[6:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [3:0] P1;
    wire [6:0] P2, P3;
    wire [9:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_5 M2(A_H, B_L, P2);
    NR_5_2 M3(A_L, B_H, P3);
    rr_5x5_17 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[8:0] operand1;
    wire[7:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_5x5_17(
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
    
    rr_4x4_18 M1(A_H, B_H, P1);
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
        
module rr_4x4_18(
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
    rr_3x3_22 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_22(
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
        
module rr_3x3_32(
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
        
module rr_3x3_39(
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
        
module rr_9x9_46(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[8:3];
    assign B_H = B[8:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [11:0] P1;
    wire [8:0] P2, P3;
    wire [5:0] P4;
    
    rr_6x6_47 M1(A_H, B_H, P1);
    NR_6_3 M2(A_H, B_L, P2);
    NR_3_6 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[14:0] operand1;
    wire[9:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_6x6_47(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[5:3];
    assign B_H = B[5:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [5:0] P1;
    wire [5:0] P2, P3;
    wire [5:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_3 M2(A_H, B_L, P2);
    NR_3_3 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[8:0] operand1;
    wire[6:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_4x4_57(
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
        