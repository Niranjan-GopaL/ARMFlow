
module multiplier16bit_49(
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
    
    rr_13x13_1 M1(A_H, B_H, P1);
    NR_13_3 M2(A_H, B_L, P2);
    NR_3_13 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
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
        
module rr_13x13_1(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[12:11];
    assign B_H = B[12:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [3:0] P1;
    wire [12:0] P2, P3;
    wire [21:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_11 M2(A_H, B_L, P2);
    NR_11_2 M3(A_L, B_H, P3);
    rr_11x11_5 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[14:0] operand1;
    wire[13:0] operand2;
    wire[15:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder15_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[14:0],P4_L};
endmodule
        
module rr_11x11_5(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[10:9];
    assign B_H = B[10:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    wire [3:0] P1;
    wire [10:0] P2, P3;
    wire [17:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_9 M2(A_H, B_L, P2);
    NR_9_2 M3(A_L, B_H, P3);
    rr_9x9_9 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[12:0] operand1;
    wire[11:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_9x9_9(
    input [8:0] A, 
    input [8:0] B, 
    output [17:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[8:4];
    assign B_H = B[8:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [9:0] P1;
    wire [8:0] P2, P3;
    wire [7:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_4 M2(A_H, B_L, P2);
    NR_4_5 M3(A_L, B_H, P3);
    rr_4x4_13 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[13:0] operand1;
    wire[9:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_4x4_13(
    input [3:0] A, 
    input [3:0] B, 
    output [7:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[3:3];
    assign B_H = B[3:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [0:0] P1;
    wire [2:0] P2, P3;
    wire [5:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_3 M2(A_H, B_L, P2);
    NR_3_1 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[3:0] operand1;
    wire[3:0] operand2;
    wire[4:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder3_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder4_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[4:0],P4_L};
endmodule
        