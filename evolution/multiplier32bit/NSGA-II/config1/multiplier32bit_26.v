
module multiplier32bit_26(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [13:0] A_H, B_H;
    wire [17:0] A_L, B_L;
    
    assign A_H = A[31:18];
    assign B_H = B[31:18];
    assign A_L = A[17:0];
    assign B_L = B[17:0];
    
    
    wire [27:0] P1;
    wire [31:0] P2, P3;
    wire [35:0] P4;
    
    rr_14x14_1 M1(A_H, B_H, P1);
    NR_14_18 M2(A_H, B_L, P2);
    NR_18_14 M3(A_L, B_H, P3);
    rr_18x18_28 M4(A_L, B_L, P4);
    
    wire[17:0] P4_L;
    wire[17:0] P4_H;

    wire[45:0] operand1;
    wire[32:0] operand2;
    wire[46:0] out;
    
    assign P4_L = P4[17:0];
    assign P4_H = P4[35:18];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder46_13 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[45:0],P4_L};
endmodule
        
module rr_14x14_1(
    input [13:0] A, 
    input [13:0] B, 
    output [27:0] P
);
    
    wire [10:0] A_H, B_H;
    wire [2:0] A_L, B_L;
    
    assign A_H = A[13:3];
    assign B_H = B[13:3];
    assign A_L = A[2:0];
    assign B_L = B[2:0];
    
    wire [21:0] P1;
    wire [13:0] P2, P3;
    wire [5:0] P4;
    
    rr_11x11_2 M1(A_H, B_H, P1);
    NR_11_3 M2(A_H, B_L, P2);
    NR_3_11 M3(A_L, B_H, P3);
    NR_3_3 M4(A_L, B_L, P4);
    
    wire[2:0] P4_L;
    wire[2:0] P4_H;

    wire[24:0] operand1;
    wire[14:0] operand2;
    wire[25:0] out;
    
    assign P4_L = P4[2:0];
    assign P4_H = P4[5:3];
    assign operand1 = {P1,P4_H};

    customAdder14_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder25_10 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[24:0],P4_L};
endmodule
        
module rr_11x11_2(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [6:0] A_H, B_H;
    wire [3:0] A_L, B_L;
    
    assign A_H = A[10:4];
    assign B_H = B[10:4];
    assign A_L = A[3:0];
    assign B_L = B[3:0];
    
    wire [13:0] P1;
    wire [10:0] P2, P3;
    wire [7:0] P4;
    
    rr_7x7_3 M1(A_H, B_H, P1);
    NR_7_4 M2(A_H, B_L, P2);
    NR_4_7 M3(A_L, B_H, P3);
    NR_4_4 M4(A_L, B_L, P4);
    
    wire[3:0] P4_L;
    wire[3:0] P4_H;

    wire[17:0] operand1;
    wire[11:0] operand2;
    wire[18:0] out;
    
    assign P4_L = P4[3:0];
    assign P4_H = P4[7:4];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder18_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[17:0],P4_L};
endmodule
        
module rr_7x7_3(
    input [6:0] A, 
    input [6:0] B, 
    output [13:0] P
);
    
    wire [5:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[6:1];
    assign B_H = B[6:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [11:0] P1;
    wire [5:0] P2, P3;
    wire [0:0] P4;
    
    rr_6x6_4 M1(A_H, B_H, P1);
    NR_6_1 M2(A_H, B_L, P2);
    NR_1_6 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[12:0] operand1;
    wire[6:0] operand2;
    wire[13:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder6_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder13_6 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_6x6_4(
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
    
    rr_4x4_5 M1(A_H, B_H, P1);
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
        
module rr_4x4_5(
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
    rr_3x3_9 M4(A_L, B_L, P4);
    
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
        
module rr_18x18_28(
    input [17:0] A, 
    input [17:0] B, 
    output [35:0] P
);
    
    wire [11:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[17:6];
    assign B_H = B[17:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [23:0] P1;
    wire [17:0] P2, P3;
    wire [11:0] P4;
    
    rr_12x12_29 M1(A_H, B_H, P1);
    NR_12_6 M2(A_H, B_L, P2);
    NR_6_12 M3(A_L, B_H, P3);
    NR_6_6 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[29:0] operand1;
    wire[18:0] operand2;
    wire[30:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder18_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder30_11 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[29:0],P4_L};
endmodule
        
module rr_12x12_29(
    input [11:0] A, 
    input [11:0] B, 
    output [23:0] P
);
    
    wire [0:0] A_H, B_H;
    wire [10:0] A_L, B_L;
    
    assign A_H = A[11:11];
    assign B_H = B[11:11];
    assign A_L = A[10:0];
    assign B_L = B[10:0];
    
    wire [0:0] P1;
    wire [10:0] P2, P3;
    wire [21:0] P4;
    
    NR_1_1 M1(A_H, B_H, P1);
    NR_1_11 M2(A_H, B_L, P2);
    NR_11_1 M3(A_L, B_H, P3);
    rr_11x11_33 M4(A_L, B_L, P4);
    
    wire[10:0] P4_L;
    wire[10:0] P4_H;

    wire[11:0] operand1;
    wire[11:0] operand2;
    wire[12:0] out;
    
    assign P4_L = P4[10:0];
    assign P4_H = P4[21:11];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder12_0 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[12:0],P4_L};
endmodule
        
module rr_11x11_33(
    input [10:0] A, 
    input [10:0] B, 
    output [21:0] P
);
    
    wire [4:0] A_H, B_H;
    wire [5:0] A_L, B_L;
    
    assign A_H = A[10:6];
    assign B_H = B[10:6];
    assign A_L = A[5:0];
    assign B_L = B[5:0];
    
    wire [9:0] P1;
    wire [10:0] P2, P3;
    wire [11:0] P4;
    
    NR_5_5 M1(A_H, B_H, P1);
    NR_5_6 M2(A_H, B_L, P2);
    NR_6_5 M3(A_L, B_H, P3);
    rr_6x6_37 M4(A_L, B_L, P4);
    
    wire[5:0] P4_L;
    wire[5:0] P4_H;

    wire[15:0] operand1;
    wire[11:0] operand2;
    wire[16:0] out;
    
    assign P4_L = P4[5:0];
    assign P4_H = P4[11:6];
    assign operand1 = {P1,P4_H};

    customAdder11_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder16_4 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[15:0],P4_L};
endmodule
        
module rr_6x6_37(
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
    
    NR_5_5 M1(A_H, B_H, P1);
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
        