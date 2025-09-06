module customAdder1_1(
                        input [0 : 0] A,
                        input [-1 : 0] B,
                        
                        output [1 : 0] Sum
                );

        wire [0 : 0] operand2_extended;
        
        assign operand2_extended =  {1'b0, B};
        
        unsignedRippleCarryAdder1bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        