
module multiplier32bit_27(
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
    
    wire [4:0] A_H, B_H;
    wire [23:0] A_L, B_L;
    
    assign A_H = A[28:24];
    assign B_H = B[28:24];
    assign A_L = A[23:0];
    assign B_L = B[23:0];
    
    wire [9:0] P1;
    wire [28:0] P2, P3;
    wire [47:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_24 M2(A_H, B_L, P2);
    NR_24_5 M3(A_L, B_H, P3);
    rr_24x24_8 M4(A_L, B_L, P4);
    
    wire[23:0] P4_L;
    wire[23:0] P4_H;

    wire[33:0] operand1;
    wire[29:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[23:0];
    assign P4_H = P4[47:24];
    assign operand1 = {P1,P4_H};

    customAdder29_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_24x24_8(
    input [23:0] A, 
    input [23:0] B, 
    output [47:0] P
);
    
    wire [20:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[23:3];
    assign B_H = B[23:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [41:0] P1;
    wire [23:0] P2, P3;
    wire [5:0] P4;
    
    rr_21x21_9 M1(A_H, B_H, P1);
    NR_21_3 M2(A_H, B_L, P2);
    NR_3_21 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[44:0] operand1;
    wire[24:0] operand2;
    wire[45:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder24_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder45_20 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[44:0],P4_L};
endmodule
        
module rr_21x21_9(
    input [20:0] A, 
    input [20:0] B, 
    output [41:0] P
);
    
    wire [16:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[20:4];
    assign B_H = B[20:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [33:0] P1;
    wire [20:0] P2, P3;
    wire [7:0] P4;
    
    NR_17_17 M1(A_H, B_H, P1);
    NR_17_4 M2(A_H, B_L, P2);
    NR_4_17 M3(A_L, B_H, P3);
    rr_4x4_13 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[37:0] operand1;
    wire[21:0] operand2;
    wire[38:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder21_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder38_16 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[37:0],P4_L};
endmodule
        
module rr_4x4_13(
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
        