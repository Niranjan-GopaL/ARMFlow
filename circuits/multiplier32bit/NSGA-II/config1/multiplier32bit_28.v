
module multiplier32bit_28(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [26:0] A_L, B_L;
    
    assign A_H = A[31:27];
    assign B_H = B[31:27];
    assign A_L = A[26:0];
    assign B_L = B[26:0];
    
    
    wire [9:0] P1;
    wire [31:0] P2, P3;
    wire [53:0] P4;
    
    rr_5x5_1 M1(A_H, B_H, P1);
    NR_5_27 M2(A_H, B_L, P2);
    NR_27_5 M3(A_L, B_H, P3);
    rr_27x27_12 M4(A_L, B_L, P4);
    
    wire[26:0] P4_L;
    wire[26:0] P4_H;

    wire[36:0] operand1;
    wire[32:0] operand2;
    wire[37:0] out;
    
    assign P4_L = P4[26:0];
    assign P4_H = P4[53:27];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder37_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[36:0],P4_L};
endmodule
        
module rr_5x5_1(
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
    rr_3x3_5 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_5(
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
        
module rr_27x27_12(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [21:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[26:5];
    assign B_H = B[26:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [43:0] P1;
    wire [26:0] P2, P3;
    wire [9:0] P4;
    
    rr_22x22_13 M1(A_H, B_H, P1);
    NR_22_5 M2(A_H, B_L, P2);
    NR_5_22 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[48:0] operand1;
    wire[27:0] operand2;
    wire[49:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder49_21 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[48:0],P4_L};
endmodule
        
module rr_22x22_13(
    input [21:0] A, 
    input [21:0] B, 
    output [43:0] P
);
    
    wire [16:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[21:5];
    assign B_H = B[21:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [33:0] P1;
    wire [21:0] P2, P3;
    wire [9:0] P4;
    
    rr_17x17_14 M1(A_H, B_H, P1);
    NR_17_5 M2(A_H, B_L, P2);
    NR_5_17 M3(A_L, B_H, P3);
    NR_5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[38:0] operand1;
    wire[22:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder22_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        
module rr_17x17_14(
    input [16:0] A, 
    input [16:0] B, 
    output [33:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[16:3];
    assign B_H = B[16:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [27:0] P1;
    wire [16:0] P2, P3;
    wire [5:0] P4;
    
    NR_14_14 M1(A_H, B_H, P1);
    NR_14_3 M2(A_H, B_L, P2);
    NR_3_14 M3(A_L, B_H, P3);
    rr_3x3_18 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[30:0] operand1;
    wire[17:0] operand2;
    wire[31:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder17_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder31_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[30:0],P4_L};
endmodule
        
module rr_3x3_18(
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
        