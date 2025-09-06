module customAdder33_21(
                        input [32 : 0] A,
                        input [11 : 0] B,
                        
                        output [33 : 0] Sum
                );

        wire [32 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder33bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        