
module multiplier32bit_37(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [23:0] A_H, B_H;
    wire [7:0] A_L, B_L;
    
    assign A_H = A[31:8];
    assign B_H = B[31:8];
    assign A_L = A[7:0];
    assign B_L = B[7:0];
    
    
    wire [47:0] P1;
    wire [31:0] P2, P3;
    wire [15:0] P4;
    
    rr_24x24_1 M1(A_H, B_H, P1);
    NR_24_8 M2(A_H, B_L, P2);
    NR_8_24 M3(A_L, B_H, P3);
    rr_8x8_28 M4(A_L, B_L, P4);
    
    wire[7:0] P4_L;
    wire[7:0] P4_H;

    wire[55:0] operand1;
    wire[32:0] operand2;
    wire[56:0] out;
    
    assign P4_L = P4[7:0];
    assign P4_H = P4[15:8];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder56_23 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[55:0],P4_L};
endmodule
        
module rr_24x24_1(
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
    
    rr_15x15_2 M1(A_H, B_H, P1);
    NR_15_9 M2(A_H, B_L, P2);
    NR_9_15 M3(A_L, B_H, P3);
    rr_9x9_9 M4(A_L, B_L, P4);
    
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
        
module rr_15x15_2(
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
    NR_5_5 M4(A_L, B_L, P4);
    
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
        
module rr_9x9_9(
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
    rr_7x7_13 M4(A_L, B_L, P4);
    
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
        
module rr_7x7_13(
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
    
    rr_5x5_14 M1(A_H, B_H, P1);
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
        
module rr_5x5_14(
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
    
    rr_3x3_15 M1(A_H, B_H, P1);
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
        
module rr_8x8_28(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[7:3];
    assign B_H = B[7:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [9:0] P1;
    wire [7:0] P2, P3;
    wire [5:0] P4;
    
    rr_5x5_29 M1(A_H, B_H, P1);
    NR_5_3 M2(A_H, B_L, P2);
    NR_3_5 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[12:0] operand1;
    wire[8:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_5x5_29(
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
    
    rr_3x3_30 M1(A_H, B_H, P1);
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
        
module rr_3x3_30(
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
        