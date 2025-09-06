
module customAdder31_22(
                    input [30 : 0] A,
                    input [8 : 0] B,
                    
                    output [31 : 0] Sum
            );

    wire [30 : 0] operand2_extended;
    
    assign operand2_extended =  {22'b0, B};
    
    unsignedRippleCarryAdder31bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        