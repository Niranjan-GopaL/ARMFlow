module customAdder53_49(
                        input [52 : 0] A,
                        input [3 : 0] B,
                        
                        output [53 : 0] Sum
                );

        wire [52 : 0] operand2_extended;
        
        assign operand2_extended =  {49'b0, B};
        
        unsignedRippleCarryAdder53bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        