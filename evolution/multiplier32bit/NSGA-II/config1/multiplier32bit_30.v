
module multiplier32bit_30(
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
        
module rr_29x29_8(
    input [28:0] A, 
    input [28:0] B, 
    output [57:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [26:0] A_L, B_L;
    
    assign A_H = A[28:27];
    assign B_H = B[28:27];
    assign A_L = A[26:0];
    assign B_L = B[26:0];
    
    wire [3:0] P1;
    wire [28:0] P2, P3;
    wire [53:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_27 M2(A_H, B_L, P2);
    NR_27_2 M3(A_L, B_H, P3);
    rr_27x27_12 M4(A_L, B_L, P4);
    
    wire[26:0] P4_L;
    wire[26:0] P4_H;

    wire[30:0] operand1;
    wire[29:0] operand2;
    wire[31:0] out;
    
    assign P4_L = P4[26:0];
    assign P4_H = P4[53:27];
    assign operand1 = {P1,P4_H};

    customAdder29_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder31_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[30:0],P4_L};
endmodule
        
module rr_27x27_12(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [25:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[26:1];
    assign B_H = B[26:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [51:0] P1;
    wire [25:0] P2, P3;
    wire [0:0] P4;
    
    rr_26x26_13 M1(A_H, B_H, P1);
    NR_26_1 M2(A_H, B_L, P2);
    NR_1_26 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[52:0] operand1;
    wire[26:0] operand2;
    wire[53:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder26_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder53_26 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[52:0],P4_L};
endmodule
        
module rr_26x26_13(
    input [25:0] A, 
    input [25:0] B, 
    output [51:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[25:11];
    assign B_H = B[25:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [29:0] P1;
    wire [25:0] P2, P3;
    wire [21:0] P4;
    
    rr_15x15_14 M1(A_H, B_H, P1);
    NR_15_11 M2(A_H, B_L, P2);
    NR_11_15 M3(A_L, B_H, P3);
    rr_11x11_29 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[40:0] operand1;
    wire[26:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder26_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_15x15_14(
    input [14:0] A, 
    input [14:0] B, 
    output [29:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[14:5];
    assign B_H = B[14:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [19:0] P1;
    wire [14:0] P2, P3;
    wire [9:0] P4;
    
    NR_10_10 M1(A_H, B_H, P1);
    NR_10_5 M2(A_H, B_L, P2);
    NR_5_10 M3(A_L, B_H, P3);
    rr_5x5_18 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[24:0] operand1;
    wire[15:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_5x5_18(
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
    
    rr_3x3_19 M1(A_H, B_H, P1);
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
        
module rr_3x3_19(
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
        
module rr_11x11_29(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[10:6];
    assign B_H = B[10:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [9:0] P1;
    wire [10:0] P2, P3;
    wire [11:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_6 M2(A_H, B_L, P2);
    NR_6_5 M3(A_L, B_H, P3);
    rr_6x6_33 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[15:0] operand1;
    wire[11:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_6x6_33(
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
    rr_5x5_37 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_37(
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
    
    rr_3x3_38 M1(A_H, B_H, P1);
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
        
module rr_3x3_38(
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
        