
module multiplier16bit_3(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [6:0] A_H, B_H;
    wire [8:0] A_L, B_L;
    
    assign A_H = A[15:9];
    assign B_H = B[15:9];
    assign A_L = A[8:0];
    assign B_L = B[8:0];
    
    
    wire [13:0] P1;
    wire [15:0] P2, P3;
    wire [17:0] P4;
    
    rr_7x7_1 M1(A_H, B_H, P1);
    NR_7_9 M2(A_H, B_L, P2);
    NR_9_7 M3(A_L, B_H, P3);
    rr_9x9_16 M4(A_L, B_L, P4);
    
    wire[8:0] P4_L;
    wire[8:0] P4_H;

    wire[22:0] operand1;
    wire[16:0] operand2;
    wire[23:0] out;
    
    assign P4_L = P4[8:0];
    assign P4_H = P4[17:9];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder23_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[22:0],P4_L};
endmodule
        
module rr_7x7_1(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[6:4];
    assign B_H = B[6:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [5:0] P1;
    wire [6:0] P2, P3;
    wire [7:0] P4;
    
    rr_3x3_2 M1(A_H, B_H, P1);
    NR_3_4 M2(A_H, B_L, P2);
    NR_4_3 M3(A_L, B_H, P3);
    rr_4x4_9 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[9:0] operand1;
    wire[7:0] operand2;
    wire[10:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder10_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[9:0],P4_L};
endmodule
        
module rr_3x3_2(
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
        
module rr_4x4_9(
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
        
module rr_9x9_16(
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
    rr_4x4_20 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_20(
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
    
    rr_3x3_21 M1(A_H, B_H, P1);
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
        
module rr_3x3_21(
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
        