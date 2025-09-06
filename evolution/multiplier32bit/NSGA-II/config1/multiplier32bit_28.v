
module multiplier32bit_28(
    input [31:0] A, 
    input [31:0] B, 
    output [63:0] P
);
    
    wire [21:0] A_H, B_H;
    wire [9:0] A_L, B_L;
    
    assign A_H = A[31:10];
    assign B_H = B[31:10];
    assign A_L = A[9:0];
    assign B_L = B[9:0];
    
    
    wire [43:0] P1;
    wire [31:0] P2, P3;
    wire [19:0] P4;
    
    rr_22x22_1 M1(A_H, B_H, P1);
    NR_22_10 M2(A_H, B_L, P2);
    NR_10_22 M3(A_L, B_H, P3);
    rr_10x10_12 M4(A_L, B_L, P4);
    
    wire[9:0] P4_L;
    wire[9:0] P4_H;

    wire[53:0] operand1;
    wire[32:0] operand2;
    wire[54:0] out;
    
    assign P4_L = P4[9:0];
    assign P4_H = P4[19:10];
    assign operand1 = {P1,P4_H};

    customAdder32_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder54_21 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[53:0],P4_L};
endmodule
        
module rr_22x22_1(
    input [21:0] A, 
    input [21:0] B, 
    output [43:0] P
);
    
    wire [3:0] A_H, B_H;
    wire [17:0] A_L, B_L;
    
    assign A_H = A[21:18];
    assign B_H = B[21:18];
    assign A_L = A[17:0];
    assign B_L = B[17:0];
    
    wire [7:0] P1;
    wire [21:0] P2, P3;
    wire [35:0] P4;
    
    rr_4x4_2 M1(A_H, B_H, P1);
    NR_4_18 M2(A_H, B_L, P2);
    NR_18_4 M3(A_L, B_H, P3);
    NR_18_18 M4(A_L, B_L, P4);
    
    wire[17:0] P4_L;
    wire[17:0] P4_H;

    wire[25:0] operand1;
    wire[22:0] operand2;
    wire[26:0] out;
    
    assign P4_L = P4[17:0];
    assign P4_H = P4[35:18];
    assign operand1 = {P1,P4_H};

    customAdder22_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder26_3 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[25:0],P4_L};
endmodule
        
module rr_4x4_2(
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
        
module rr_10x10_12(
    input [9:0] A, 
    input [9:0] B, 
    output [19:0] P
);
    
    wire [8:0] A_H, B_H;
    wire [0:0] A_L, B_L;
    
    assign A_H = A[9:1];
    assign B_H = B[9:1];
    assign A_L = A[0:0];
    assign B_L = B[0:0];
    
    wire [17:0] P1;
    wire [8:0] P2, P3;
    wire [0:0] P4;
    
    NR_9_9 M1(A_H, B_H, P1);
    NR_9_1 M2(A_H, B_L, P2);
    NR_1_9 M3(A_L, B_H, P3);
    NR_1_1 M4(A_L, B_L, P4);
    
    wire[0:0] P4_L;
    wire[0:0] P4_H;

    wire[18:0] operand1;
    wire[9:0] operand2;
    wire[19:0] out;
    
    assign P4_L = P4[0:0];
    assign P4_H = 1'b0;
    assign operand1 = {P1,P4_H};

    customAdder9_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder19_9 adder2(
        operand1,
        operand2,
        out
    );
    assign P = {out[18:0],P4_L};
endmodule
        