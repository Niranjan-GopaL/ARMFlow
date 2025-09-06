
module multiplier16bit_1(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[15:3];
    assign B_H = B[15:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    
    wire [25:0] P1;
    wire [15:0] P2, P3;
    wire [5:0] P4;
    
    NR_13_13 M1(A_H, B_H, P1);
    NR_13_3 M2(A_H, B_L, P2);
    NR_3_13 M3(A_L, B_H, P3);
    rr_3x3_4 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[28:0] operand1;
    wire[16:0] operand2;
    wire[29:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder29_12 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[28:0],P4_L};
endmodule
        
module rr_3x3_4(
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
        