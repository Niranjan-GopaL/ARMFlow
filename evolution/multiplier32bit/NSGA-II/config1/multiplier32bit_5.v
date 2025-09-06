
module multiplier32bit_5(
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
    
    wire [2:0] A_H, B_H;
    wire [23:0] A_L, B_L;
    
    assign A_H = A[26:24];
    assign B_H = B[26:24];
    assign A_L = A[23:0];
    assign B_L = B[23:0];
    
    wire [5:0] P1;
    wire [26:0] P2, P3;
    wire [47:0] P4;
    
    rr_3x3_2 M1(A_H, B_H, P1);
    NR_3_24 M2(A_H, B_L, P2);
    NR_24_3 M3(A_L, B_H, P3);
    rr_24x24_9 M4(A_L, B_L, P4);
    
    wire[23:0] P4_L;
    wire[23:0] P4_H;

    wire[29:0] operand1;
    wire[27:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[23:0];
    assign P4_H = P4[47:24];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_3x3_2(
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
        
module rr_24x24_9(
    input [23:0] A, 
    input [23:0] B, 
    output [47:0] P
);
    
    wire [19:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[23:4];
    assign B_H = B[23:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [39:0] P1;
    wire [23:0] P2, P3;
    wire [7:0] P4;
    
    rr_20x20_10 M1(A_H, B_H, P1);
    NR_20_4 M2(A_H, B_L, P2);
    NR_4_20 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[43:0] operand1;
    wire[24:0] operand2;
    wire[44:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder24_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder44_19 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[43:0],P4_L};
endmodule
        
module rr_20x20_10(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[19:5];
    assign B_H = B[19:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [29:0] P1;
    wire [19:0] P2, P3;
    wire [9:0] P4;
    
    rr_15x15_11 M1(A_H, B_H, P1);
    NR_15_5 M2(A_H, B_L, P2);
    NR_5_15 M3(A_L, B_H, P3);
    rr_5x5_38 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[34:0] operand1;
    wire[20:0] operand2;
    wire[35:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder35_14 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[34:0],P4_L};
endmodule
        
module rr_15x15_11(
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
    
    rr_13x13_12 M1(A_H, B_H, P1);
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
        
module rr_13x13_12(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[12:7];
    assign B_H = B[12:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [11:0] P1;
    wire [12:0] P2, P3;
    wire [13:0] P4;
    
    rr_6x6_13 M1(A_H, B_H, P1);
    NR_6_7 M2(A_H, B_L, P2);
    NR_7_6 M3(A_L, B_H, P3);
    rr_7x7_28 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[18:0] operand1;
    wire[13:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
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
        
module rr_7x7_28(
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
    
    NR_5_5 M1(A_H, B_H, P1);
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
        
module rr_5x5_38(
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
    
    NR_4_4 M1(A_H, B_H, P1);
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
        