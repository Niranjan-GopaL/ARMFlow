
module multiplier16bit_16(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
    wire [9:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[15:6];
    assign B_H = B[15:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    
    wire [19:0] P1;
    wire [15:0] P2, P3;
    wire [11:0] P4;
    
    rr_10x10_1 M1(A_H, B_H, P1);
    NR_10_6 M2(A_H, B_L, P2);
    NR_6_10 M3(A_L, B_H, P3);
    rr_6x6_24 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[25:0] operand1;
    wire[16:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_10x10_1(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[9:2];
    assign B_H = B[9:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [15:0] P1;
    wire [9:0] P2, P3;
    wire [3:0] P4;
    
    rr_8x8_2 M1(A_H, B_H, P1);
    NR_8_2 M2(A_H, B_L, P2);
    NR_2_8 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[17:0] operand1;
    wire[10:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder10_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_8x8_2(
    input [7:0] A, 
    input [7:0] B, 
    output [15:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[7:2];
    assign B_H = B[7:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [11:0] P1;
    wire [7:0] P2, P3;
    wire [3:0] P4;
    
    rr_6x6_3 M1(A_H, B_H, P1);
    NR_6_2 M2(A_H, B_L, P2);
    NR_2_6 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[13:0] operand1;
    wire[8:0] operand2;
    wire[14:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder8_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder14_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[13:0],P4_L};
endmodule
        
module rr_6x6_3(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[5:1];
    assign B_H = B[5:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [9:0] P1;
    wire [4:0] P2, P3;
    wire [0:0] P4;
    
    rr_5x5_4 M1(A_H, B_H, P1);
    NR_5_1 M2(A_H, B_L, P2);
    NR_1_5 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[10:0] operand1;
    wire[5:0] operand2;
    wire[11:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder11_5 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[10:0],P4_L};
endmodule
        
module rr_5x5_4(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[4:4];
    assign B_H = B[4:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [0:0] P1;
    wire [3:0] P2, P3;
    wire [7:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_4 M2(A_H, B_L, P2);
    NR_4_1 M3(A_L, B_H, P3);
    rr_4x4_8 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[4:0] operand1;
    wire[4:0] operand2;
    wire[5:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder4_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder5_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[5:0],P4_L};
endmodule
        
module rr_4x4_8(
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
        
module rr_6x6_24(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[5:2];
    assign B_H = B[5:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [7:0] P1;
    wire [5:0] P2, P3;
    wire [3:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_2 M2(A_H, B_L, P2);
    NR_2_4 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[9:0] operand1;
    wire[6:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        