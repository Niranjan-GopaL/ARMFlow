
module multiplier16bit_39(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [14:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[15:1];
    assign B_H = B[15:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    
    wire [29:0] P1;
    wire [14:0] P2, P3;
    wire [0:0] P4;
    
    rr_15x15_1 M1(A_H, B_H, P1);
    NR_15_1 M2(A_H, B_L, P2);
    NR_1_15 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[30:0] operand1;
    wire[15:0] operand2;
    wire[31:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder15_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder31_15 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[30:0],P4_L};
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
    NR_11_11 M4(A_L, B_L, P4);
    
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
        