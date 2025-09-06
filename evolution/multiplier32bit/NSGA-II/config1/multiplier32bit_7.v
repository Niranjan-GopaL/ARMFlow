
module multiplier32bit_7(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [27:0] A_L, B_L;
    
    assign A_H = A[31:28];
    assign B_H = B[31:28];
    assign A_L = A[27:0];
    assign B_L = B[27:0];
    
    
    wire [7:0] P1;
    wire [31:0] P2, P3;
    wire [55:0] P4;
    
    rr_4x4_1 M1(A_H, B_H, P1);
    NR_4_28 M2(A_H, B_L, P2);
    NR_28_4 M3(A_L, B_H, P3);
    rr_28x28_8 M4(A_L, B_L, P4);
    
    wire[27:0] P4_L;
    wire[27:0] P4_H;

    wire[35:0] operand1;
    wire[32:0] operand2;
    wire[36:0] out;
    
    assign P4_L = P4[27:0];
    assign P4_H = P4[55:28];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder36_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[35:0],P4_L};
endmodule
        
module rr_4x4_1(
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
    
    NR_3_3 M1(A_H, B_H, P1);
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
        
module rr_28x28_8(
    input [27:0] A, 
    input [27:0] B, 
    output [55:0] P
);
    
    wire [25:0] A_H, B_H;
    wire [1:0] A_L, B_L;
    
    assign A_H = A[27:2];
    assign B_H = B[27:2];
    assign A_L = A[1:0];
    assign B_L = B[1:0];
    
    wire [51:0] P1;
    wire [27:0] P2, P3;
    wire [3:0] P4;
    
    rr_26x26_9 M1(A_H, B_H, P1);
    NR_26_2 M2(A_H, B_L, P2);
    NR_2_26 M3(A_L, B_H, P3);
    NR_2_2 M4(A_L, B_L, P4);
    
    wire[1:0] P4_L;
    wire[1:0] P4_H;

    wire[53:0] operand1;
    wire[28:0] operand2;
    wire[54:0] out;
    
    assign P4_L = P4[1:0];
    assign P4_H = P4[3:2];
    assign operand1 = {P1,P4_H};

    customAdder28_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder54_25 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[53:0],P4_L};
endmodule
        
module rr_26x26_9(
    input [25:0] A, 
    input [25:0] B, 
    output [51:0] P
);
    
    wire [24:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[25:1];
    assign B_H = B[25:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [49:0] P1;
    wire [24:0] P2, P3;
    wire [0:0] P4;
    
    rr_25x25_10 M1(A_H, B_H, P1);
    NR_25_1 M2(A_H, B_L, P2);
    NR_1_25 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[50:0] operand1;
    wire[25:0] operand2;
    wire[51:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder51_25 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[50:0],P4_L};
endmodule
        
module rr_25x25_10(
    input [24:0] A, 
    input [24:0] B, 
    output [49:0] P
);
    
    wire [17:0] A_H, B_H;
    wire [6:0] A_L, B_L;
    
    assign A_H = A[24:7];
    assign B_H = B[24:7];
    assign A_L = A[6:0];
    assign B_L = B[6:0];
    
    wire [35:0] P1;
    wire [24:0] P2, P3;
    wire [13:0] P4;
    
    rr_18x18_11 M1(A_H, B_H, P1);
    NR_18_7 M2(A_H, B_L, P2);
    NR_7_18 M3(A_L, B_H, P3);
    rr_7x7_22 M4(A_L, B_L, P4);
    
    wire[6:0] P4_L;
    wire[6:0] P4_H;

    wire[42:0] operand1;
    wire[25:0] operand2;
    wire[43:0] out;
    
    assign P4_L = P4[6:0];
    assign P4_H = P4[13:7];
    assign operand1 = {P1,P4_H};

    customAdder25_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder43_17 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[42:0],P4_L};
endmodule
        
module rr_18x18_11(
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
    
    rr_4x4_12 M1(A_H, B_H, P1);
    NR_4_14 M2(A_H, B_L, P2);
    NR_14_4 M3(A_L, B_H, P3);
    NR_14_14 M4(A_L, B_L, P4);
    
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
        
module rr_4x4_12(
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
        
module rr_7x7_22(
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
    rr_5x5_26 M4(A_L, B_L, P4);
    
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
        
module rr_5x5_26(
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
        