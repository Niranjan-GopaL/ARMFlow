
module multiplier32bit_5(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [22:0] A_L, B_L;
    
    assign A_H = A[31:23];
    assign B_H = B[31:23];
    assign A_L = A[22:0];
    assign B_L = B[22:0];
    
    
    wire [17:0] P1;
    wire [31:0] P2, P3;
    wire [45:0] P4;
    
    rr_9x9_1 M1(A_H, B_H, P1);
    NR_9_23 M2(A_H, B_L, P2);
    NR_23_9 M3(A_L, B_H, P3);
    NR_23_23 M4(A_L, B_L, P4);
    
    wire[22:0] P4_L;
    wire[22:0] P4_H;

    wire[40:0] operand1;
    wire[32:0] operand2;
    wire[41:0] out;
    
    assign P4_L = P4[22:0];
    assign P4_H = P4[45:23];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder41_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[40:0],P4_L};
endmodule
        
module rr_9x9_1(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[8:1];
    assign B_H = B[8:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [15:0] P1;
    wire [7:0] P2, P3;
    wire [0:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_1 M2(A_H, B_L, P2);
    NR_1_8 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[16:0] operand1;
    wire[8:0] operand2;
    wire[17:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder17_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[16:0],P4_L};
endmodule
        