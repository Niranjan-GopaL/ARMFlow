
module multiplier32bit_19(
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
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_29 M2(A_H, B_L, P2);
    NR_29_3 M3(A_L, B_H, P3);
    rr_29x29_4 M4(A_L, B_L, P4);
    
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
        
module rr_29x29_4(
    input [28:0] A, 
    input [28:0] B, 
    output [57:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [24:0] A_L, B_L;
    
    assign A_H = A[28:25];
    assign B_H = B[28:25];
    assign A_L = A[24:0];
    assign B_L = B[24:0];
    
    wire [7:0] P1;
    wire [28:0] P2, P3;
    wire [49:0] P4;
    
    rr_4x4_5 M1(A_H, B_H, P1);
    NR_4_25 M2(A_H, B_L, P2);
    NR_25_4 M3(A_L, B_H, P3);
    NR_25_25 M4(A_L, B_L, P4);
    
    wire[24:0] P4_L;
    wire[24:0] P4_H;

    wire[32:0] operand1;
    wire[29:0] operand2;
    wire[33:0] out;
    
    assign P4_L = P4[24:0];
    assign P4_H = P4[49:25];
    assign operand1 = {P1,P4_H};

    customAdder29_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder33_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[32:0],P4_L};
endmodule
        
module rr_4x4_5(
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
    
    rr_3x3_6 M1(A_H, B_H, P1);
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
        
module rr_3x3_6(
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
        