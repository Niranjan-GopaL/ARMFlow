
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder10bit(input [9:0] A, B, output [10:0]Sum);


	wire carry0;
	wire carry1;
	wire carry2;
	wire carry3;
	wire carry4;
	wire carry5;
	wire carry6;
	wire carry7;
	wire carry8;
	wire carry9;
	HalfAdder uut0(A[0], B[0], Sum[0], carry0);
	FullAdder uut1(A[1], B[1], carry0, Sum[1], carry1);
	FullAdder uut2(A[2], B[2], carry1, Sum[2], carry2);
	FullAdder uut3(A[3], B[3], carry2, Sum[3], carry3);
	FullAdder uut4(A[4], B[4], carry3, Sum[4], carry4);
	FullAdder uut5(A[5], B[5], carry4, Sum[5], carry5);
	FullAdder uut6(A[6], B[6], carry5, Sum[6], carry6);
	FullAdder uut7(A[7], B[7], carry6, Sum[7], carry7);
	FullAdder uut8(A[8], B[8], carry7, Sum[8], carry8);
	FullAdder uut9(A[9], B[9], carry8, Sum[9], carry9);
	assign Sum[10] = carry9;
endmodule
