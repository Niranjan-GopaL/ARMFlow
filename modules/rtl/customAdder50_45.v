module customAdder50_45(
                        input [49 : 0] A,
                        input [4 : 0] B,
                        
                        output [50 : 0] Sum
                );

        wire [49 : 0] operand2_extended;
        
        assign operand2_extended =  {45'b0, B};
        
        unsignedRippleCarryAdder50bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        