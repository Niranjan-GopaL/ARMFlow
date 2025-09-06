
module multiplier32bit_16(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [19:0] A_H, B_H;
    wire [11:0] A_L, B_L;
    
    assign A_H = A[31:12];
    assign B_H = B[31:12];
    assign A_L = A[11:0];
    assign B_L = B[11:0];
    
    
    wire [39:0] P1;
    wire [31:0] P2, P3;
    wire [23:0] P4;
    
    rr_20x20_1 M1(A_H, B_H, P1);
    NR_20_12 M2(A_H, B_L, P2);
    NR_12_20 M3(A_L, B_H, P3);
    rr_12x12_24 M4(A_L, B_L, P4);
    
    wire[11:0] P4_L;
    wire[11:0] P4_H;

    wire[51:0] operand1;
    wire[32:0] operand2;
    wire[52:0] out;
    
    assign P4_L = P4[11:0];
    assign P4_H = P4[23:12];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder52_19 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[51:0],P4_L};
endmodule
        
module rr_20x20_1(
    input [19:0] A, 
    input [19:0] B, 
    output [39:0] P
);
    
    wire [1:0] A_H, B_H;
    wire [17:0] A_L, B_L;
    
    assign A_H = A[19:18];
    assign B_H = B[19:18];
    assign A_L = A[17:0];
    assign B_L = B[17:0];
    
    wire [3:0] P1;
    wire [19:0] P2, P3;
    wire [35:0] P4;
    
    NR_2_2 M1(A_H, B_H, P1);
    NR_2_18 M2(A_H, B_L, P2);
    NR_18_2 M3(A_L, B_H, P3);
    rr_18x18_5 M4(A_L, B_L, P4);
    
    wire[17:0] P4_L;
    wire[17:0] P4_H;

    wire[21:0] operand1;
    wire[20:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[17:0];
    assign P4_H = P4[35:18];
    assign operand1 = {P1,P4_H};

    customAdder20_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_1 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_18x18_5(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [13:0] A_L, B_L;
    
    assign A_H = A[17:14];
    assign B_H = B[17:14];
    assign A_L = A[13:0];
    assign B_L = B[13:0];
    
    wire [7:0] P1;
    wire [17:0] P2, P3;
    wire [27:0] P4;
    
    rr_4x4_6 M1(A_H, B_H, P1);
    NR_4_14 M2(A_H, B_L, P2);
    NR_14_4 M3(A_L, B_H, P3);
    rr_14x14_13 M4(A_L, B_L, P4);
    
    wire[13:0] P4_L;
    wire[13:0] P4_H;

    wire[21:0] operand1;
    wire[18:0] operand2;
    wire[22:0] out;
    
    assign P4_L = P4[13:0];
    assign P4_H = P4[27:14];
    assign operand1 = {P1,P4_H};

    customAdder18_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder22_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[21:0],P4_L};
endmodule
        
module rr_4x4_6(
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
        
module rr_14x14_13(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [12:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[13:1];
    assign B_H = B[13:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [25:0] P1;
    wire [12:0] P2, P3;
    wire [0:0] P4;
    
    rr_13x13_14 M1(A_H, B_H, P1);
    NR_13_1 M2(A_H, B_L, P2);
    NR_1_13 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[26:0] operand1;
    wire[13:0] operand2;
    wire[27:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder27_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[26:0],P4_L};
endmodule
        
module rr_13x13_14(
    input [12:0] A, 
    input [12:0] B, 
    output [25:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[12:2];
    assign B_H = B[12:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [21:0] P1;
    wire [12:0] P2, P3;
    wire [3:0] P4;
    
    NR_11_11 M1(A_H, B_H, P1);
    NR_11_2 M2(A_H, B_L, P2);
    NR_2_11 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[23:0] operand1;
    wire[13:0] operand2;
    wire[24:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder13_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder24_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[23:0],P4_L};
endmodule
        
module rr_12x12_24(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [7:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[11:4];
    assign B_H = B[11:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [15:0] P1;
    wire [11:0] P2, P3;
    wire [7:0] P4;
    
    NR_8_8 M1(A_H, B_H, P1);
    NR_8_4 M2(A_H, B_L, P2);
    NR_4_8 M3(A_L, B_H, P3);
    rr_4x4_28 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[19:0] operand1;
    wire[12:0] operand2;
    wire[20:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder12_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder20_7 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[19:0],P4_L};
endmodule
        
module rr_4x4_28(
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
        