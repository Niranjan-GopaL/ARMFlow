
module multiplier32bit_23(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[31:28];
    assign B_H = B[31:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    
    wire [7:0] P1;
    wire [31:0] P2, P3;
    wire [55:0] P4;
    
    rr_4x4_1 M1(A_H, B_H, P1);
    NR_4_28 M2(A_H, B_L, P2);
    NR_28_4 M3(A_L, B_H, P3);
    rr_28x28_8 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[35:0] operand1;
    wire[32:0] operand2;
    wire[36:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder36_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[35:0],P4_L};
endmodule
        
module rr_4x4_1(
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
        
module rr_28x28_8(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [22:0] A_L, B_L;
    
    assign A_H = A[27:23];
    assign B_H = B[27:23];
    assign A_L = A[22:0];
    assign B_L = B[22:0];
    
    wire [9:0] P1;
    wire [27:0] P2, P3;
    wire [45:0] P4;
    
    rr_5x5_9 M1(A_H, B_H, P1);
    NR_5_23 M2(A_H, B_L, P2);
    NR_23_5 M3(A_L, B_H, P3);
    rr_23x23_16 M4(A_L, B_L, P4);
    
    wire[22:0] P4_L;
    wire[22:0] P4_H;

    wire[32:0] operand1;
    wire[28:0] operand2;
    wire[33:0] out;
    
    assign P4_L = P4[22:0];
    assign P4_H = P4[45:23];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder33_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
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
        
module rr_23x23_16(
    input [22:0] A, 
    input [22:0] B, 
    output [45:0] P
);
    
    wire [15:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[22:7];
    assign B_H = B[22:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [31:0] P1;
    wire [22:0] P2, P3;
    wire [13:0] P4;
    
    NR_16_16 M1(A_H, B_H, P1);
    NR_16_7 M2(A_H, B_L, P2);
    NR_7_16 M3(A_L, B_H, P3);
    NR_7_7 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[38:0] operand1;
    wire[23:0] operand2;
    wire[39:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder23_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder39_15 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[38:0],P4_L};
endmodule
        