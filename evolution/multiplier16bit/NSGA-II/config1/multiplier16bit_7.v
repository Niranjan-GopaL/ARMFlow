
module multiplier16bit_7(
    input [15:0] A, 
    input [15:0] B, 
    output [31:0] P
);
    
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
    
    wire [1:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[6:5];
    assign B_H = B[6:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [3:0] P1;
    wire [6:0] P2, P3;
    wire [9:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_5 M2(A_H, B_L, P2);
    NR_5_2 M3(A_L, B_H, P3);
    rr_5x5_5 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[8:0] operand1;
    wire[7:0] operand2;
    wire[9:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder9_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[8:0],P4_L};
endmodule
        
module rr_5x5_5(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[4:3];
    assign B_H = B[4:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [3:0] P1;
    wire [4:0] P2, P3;
    wire [5:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_3 M2(A_H, B_L, P2);
    NR_3_2 M3(A_L, B_H, P3);
    rr_3x3_9 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[6:0] operand1;
    wire[5:0] operand2;
    wire[7:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder7_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[6:0],P4_L};
endmodule
        
module rr_3x3_9(
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
    
    rr_5x5_17 M1(A_H, B_H, P1);
    NR_5_4 M2(A_H, B_L, P2);
    NR_4_5 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_17(
    input [4:0] A, 
    input [4:0] B, 
    output [9:0] P
);
    
    wire [2:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[4:2];
    assign B_H = B[4:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [5:0] P1;
    wire [4:0] P2, P3;
    wire [3:0] P4;
    
    NR_3_3 M1(A_H, B_H, P1);
    NR_3_2 M2(A_H, B_L, P2);
    NR_2_3 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[7:0] operand1;
    wire[5:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder5_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_2 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        