
module multiplier32bit_16(
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
    rr_27x27_16 M4(A_L, B_L, P4);
    
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
    
    wire [3:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[4:1];
    assign B_H = B[4:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [7:0] P1;
    wire [3:0] P2, P3;
    wire [0:0] P4;
    
    rr_4x4_2 M1(A_H, B_H, P1);
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
        
module rr_4x4_2(
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
    
    rr_3x3_3 M1(A_H, B_H, P1);
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
        
module rr_3x3_3(
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
        
module rr_27x27_16(
    input [26:0] A, 
    input [26:0] B, 
    output [53:0] P
);
    
    wire [19:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[26:7];
    assign B_H = B[26:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [39:0] P1;
    wire [26:0] P2, P3;
    wire [13:0] P4;
    
    rr_20x20_17 M1(A_H, B_H, P1);
    NR_20_7 M2(A_H, B_L, P2);
    NR_7_20 M3(A_L, B_H, P3);
    rr_7x7_24 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[46:0] operand1;
    wire[27:0] operand2;
    wire[47:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder27_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder47_19 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[46:0],P4_L};
endmodule
        
module rr_20x20_17(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[19:6];
    assign B_H = B[19:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [27:0] P1;
    wire [19:0] P2, P3;
    wire [11:0] P4;
    
    NR_14_14 M1(A_H, B_H, P1);
    NR_14_6 M2(A_H, B_L, P2);
    NR_6_14 M3(A_L, B_H, P3);
    NR_6_6 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[33:0] operand1;
    wire[20:0] operand2;
    wire[34:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder34_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[33:0],P4_L};
endmodule
        
module rr_7x7_24(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[6:3];
    assign B_H = B[6:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [7:0] P1;
    wire [6:0] P2, P3;
    wire [5:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_3 M2(A_H, B_L, P2);
    NR_3_4 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[10:0] operand1;
    wire[7:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        