
module multiplier32bit_11(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [24:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[31:7];
    assign B_H = B[31:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    
    wire [49:0] P1;
    wire [31:0] P2, P3;
    wire [13:0] P4;
    
    rr_25x25_1 M1(A_H, B_H, P1);
    NR_25_7 M2(A_H, B_L, P2);
    NR_7_25 M3(A_L, B_H, P3);
    rr_7x7_24 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[56:0] operand1;
    wire[32:0] operand2;
    wire[57:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder57_24 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[56:0],P4_L};
endmodule
        
module rr_25x25_1(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [19:0] A_H, B_H;
    wire [4:0] A_L, B_L;
    
    assign A_H = A[24:5];
    assign B_H = B[24:5];
    assign A_L = A[4:0];
    assign B_L = B[4:0];
    
    wire [39:0] P1;
    wire [24:0] P2, P3;
    wire [9:0] P4;
    
    rr_20x20_2 M1(A_H, B_H, P1);
    NR_20_5 M2(A_H, B_L, P2);
    NR_5_20 M3(A_L, B_H, P3);
    rr_5x5_13 M4(A_L, B_L, P4);
    
    wire[4:0] P4_L;
    wire[4:0] P4_H;

    wire[44:0] operand1;
    wire[25:0] operand2;
    wire[45:0] out;
    
    assign P4_L = P4[4:0];
    assign P4_H = P4[9:5];
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder45_19 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[44:0],P4_L};
endmodule
        
module rr_20x20_2(
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
    rr_6x6_6 M4(A_L, B_L, P4);
    
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
        
module rr_6x6_6(
    input [5:0] A, 
    input [5:0] B, 
    output [11:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[5:4];
    assign B_H = B[5:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [3:0] P1;
    wire [5:0] P2, P3;
    wire [7:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_4 M2(A_H, B_L, P2);
    NR_4_2 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[7:0] operand1;
    wire[6:0] operand2;
    wire[8:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder8_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[7:0],P4_L};
endmodule
        
module rr_5x5_13(
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
    rr_3x3_17 M4(A_L, B_L, P4);
    
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
        
module rr_3x3_17(
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
        
module rr_7x7_24(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[6:2];
    assign B_H = B[6:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [9:0] P1;
    wire [6:0] P2, P3;
    wire [3:0] P4;
    
    rr_5x5_25 M1(A_H, B_H, P1);
    NR_5_2 M2(A_H, B_L, P2);
    NR_2_5 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[11:0] operand1;
    wire[7:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder7_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[11:0],P4_L};
endmodule
        
module rr_5x5_25(
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
    NR_3_3 M4(A_L, B_L, P4);
    
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
        