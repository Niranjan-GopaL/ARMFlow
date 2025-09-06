module customAdder53_10(
                        input [52 : 0] A,
                        input [42 : 0] B,
                        
                        output [53 : 0] Sum
                );

        wire [52 : 0] operand2_extended;
        
        assign operand2_extended =  {10'b0, B};
        
        unsignedRippleCarryAdder53bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        