module customAdder50_9(
                        input [49 : 0] A,
                        input [40 : 0] B,
                        
                        output [50 : 0] Sum
                );

        wire [49 : 0] operand2_extended;
        
        assign operand2_extended =  {9'b0, B};
        
        unsignedRippleCarryAdder50bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        