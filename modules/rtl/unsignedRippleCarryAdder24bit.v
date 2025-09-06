
module HalfAdder(input a, input b, output sum, output cout);

    assign sum = a ^ b;
    assign cout = a & b;
endmodule

module FullAdder(input a, input b, input cin, output sum, output cout);

    assign {cout,sum} = a + b + cin;
endmodule

module unsignedRippleCarryAdder24bit(input [23:0] A, B, output [24:0]Sum);


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
	wire carry10;
	wire carry11;
	wire carry12;
	wire carry13;
	wire carry14;
	wire carry15;
	wire carry16;
	wire carry17;
	wire carry18;
	wire carry19;
	wire carry20;
	wire carry21;
	wire carry22;
	wire carry23;
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
	FullAdder uut10(A[10], B[10], carry9, Sum[10], carry10);
	FullAdder uut11(A[11], B[11], carry10, Sum[11], carry11);
	FullAdder uut12(A[12], B[12], carry11, Sum[12], carry12);
	FullAdder uut13(A[13], B[13], carry12, Sum[13], carry13);
	FullAdder uut14(A[14], B[14], carry13, Sum[14], carry14);
	FullAdder uut15(A[15], B[15], carry14, Sum[15], carry15);
	FullAdder uut16(A[16], B[16], carry15, Sum[16], carry16);
	FullAdder uut17(A[17], B[17], carry16, Sum[17], carry17);
	FullAdder uut18(A[18], B[18], carry17, Sum[18], carry18);
	FullAdder uut19(A[19], B[19], carry18, Sum[19], carry19);
	FullAdder uut20(A[20], B[20], carry19, Sum[20], carry20);
	FullAdder uut21(A[21], B[21], carry20, Sum[21], carry21);
	FullAdder uut22(A[22], B[22], carry21, Sum[22], carry22);
	FullAdder uut23(A[23], B[23], carry22, Sum[23], carry23);
	assign Sum[24] = carry23;
endmodule
