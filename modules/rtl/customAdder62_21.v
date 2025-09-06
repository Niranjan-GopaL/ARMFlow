module customAdder62_21(
                        input [61 : 0] A,
                        input [40 : 0] B,
                        
                        output [62 : 0] Sum
                );

        wire [61 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder62bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        