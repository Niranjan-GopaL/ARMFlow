
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder3bit(input [2:0] A, B, output [3:0]Sum);


	wire carry0;
	wire carry1;
	wire carry2;
	HalfAdder uut0(A[0], B[0], Sum[0], carry0);
	FullAdder uut1(A[1], B[1], carry0, Sum[1], carry1);
	FullAdder uut2(A[2], B[2], carry1, Sum[2], carry2);
	assign Sum[3] = carry2;
endmodule
