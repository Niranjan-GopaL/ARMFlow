module customAdder53_40(
                        input [52 : 0] A,
                        input [12 : 0] B,
                        
                        output [53 : 0] Sum
                );

        wire [52 : 0] operand2_extended;
        
        assign operand2_extended =  {40'b0, B};
        
        unsignedRippleCarryAdder53bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        