module customAdder43_18(
                        input [42 : 0] A,
                        input [24 : 0] B,
                        
                        output [43 : 0] Sum
                );

        wire [42 : 0] operand2_extended;
        
        assign operand2_extended =  {18'b0, B};
        
        unsignedRippleCarryAdder43bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        