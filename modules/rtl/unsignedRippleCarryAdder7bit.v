
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder7bit(input [6:0] A, B, output [7:0]Sum);


	wire carry0;
	wire carry1;
	wire carry2;
	wire carry3;
	wire carry4;
	wire carry5;
	wire carry6;
	HalfAdder uut0(A[0], B[0], Sum[0], carry0);
	FullAdder uut1(A[1], B[1], carry0, Sum[1], carry1);
	FullAdder uut2(A[2], B[2], carry1, Sum[2], carry2);
	FullAdder uut3(A[3], B[3], carry2, Sum[3], carry3);
	FullAdder uut4(A[4], B[4], carry3, Sum[4], carry4);
	FullAdder uut5(A[5], B[5], carry4, Sum[5], carry5);
	FullAdder uut6(A[6], B[6], carry5, Sum[6], carry6);
	assign Sum[7] = carry6;
endmodule
