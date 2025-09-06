
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder1bit(input [0:0] A, B, output [1:0]Sum);


	wire carry0;
	HalfAdder uut0(A[0], B[0], Sum[0], carry0);
	assign Sum[1] = carry0;
endmodule
