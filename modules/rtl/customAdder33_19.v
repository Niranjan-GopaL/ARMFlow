module customAdder33_19(
                        input [32 : 0] A,
                        input [13 : 0] B,
                        
                        output [33 : 0] Sum
                );

        wire [32 : 0] operand2_extended;
        
        assign operand2_extended =  {19'b0, B};
        
        unsignedRippleCarryAdder33bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        