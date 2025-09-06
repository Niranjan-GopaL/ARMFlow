
module multiplier16bit_19(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[15:4];
    assign B_H = B[15:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    
    wire [23:0] P1;
    wire [15:0] P2, P3;
    wire [7:0] P4;
    
    rr_12x12_1 M1(A_H, B_H, P1);
    NR_12_4 M2(A_H, B_L, P2);
    NR_4_12 M3(A_L, B_H, P3);
    rr_4x4_20 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[27:0] operand1;
    wire[16:0] operand2;
    wire[28:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder28_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[27:0],P4_L};
endmodule
        
module rr_12x12_1(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[11:3];
    assign B_H = B[11:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [17:0] P1;
    wire [11:0] P2, P3;
    wire [5:0] P4;
    
    rr_9x9_2 M1(A_H, B_H, P1);
    NR_9_3 M2(A_H, B_L, P2);
    NR_3_9 M3(A_L, B_H, P3);
    rr_3x3_13 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[20:0] operand1;
    wire[12:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_9x9_2(
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
    rr_7x7_6 M4(A_L, B_L, P4);
    
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
    NR_6_6 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_13(
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
        
module rr_4x4_20(
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
        