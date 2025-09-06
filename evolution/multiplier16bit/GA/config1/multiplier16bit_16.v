
module multiplier16bit_16(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    // _AH__   _____AL___________ 
    // _BH__   _____BL___________ 
    // Lower bits are given to Higher part of bits, the other orientation is not considered
    wire [3:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[15:12];
    assign B_H = B[15:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    
    wire [7:0] P1;
    wire [15:0] P2, P3;
    wire [23:0] P4;
    
    NR_4_4 M1(A_H, B_H, P1);
    NR_4_12 M2(A_H, B_L, P2);
    NR_12_4 M3(A_L, B_H, P3);
    rr_12x12_4 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[19:0] operand1;
    wire[16:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder16_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_12x12_4(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[11:3];
    assign B_H = B[11:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [17:0] P1;
    wire [11:0] P2, P3;
    wire [5:0] P4;
    
    rr_9x9_5 M1(A_H, B_H, P1);
    NR_9_3 M2(A_H, B_L, P2);
    NR_3_9 M3(A_L, B_H, P3);
    rr_3x3_12 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[20:0] operand1;
    wire[12:0] operand2;
    wire[21:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder21_8 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[20:0],P4_L};
endmodule
        
module rr_9x9_5(
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
        
module rr_3x3_12(
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
        