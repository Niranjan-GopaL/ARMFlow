
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder2bit(input [1:0] A, B, output [2:0]Sum);


	wire carry0;
	wire carry1;
	HalfAdder uut0(A[0], B[0], Sum[0], carry0);
	FullAdder uut1(A[1], B[1], carry0, Sum[1], carry1);
	assign Sum[2] = carry1;
endmodule
