
module multiplier16bit_5(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[15:2];
    assign B_H = B[15:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    
    wire [27:0] P1;
    wire [15:0] P2, P3;
    wire [3:0] P4;
    
    NR_14_14 M1(A_H, B_H, P1);
    NR_14_2 M2(A_H, B_L, P2);
    NR_2_14 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[29:0] operand1;
    wire[16:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        