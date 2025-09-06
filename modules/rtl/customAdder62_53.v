module customAdder62_53(
                        input [61 : 0] A,
                        input [8 : 0] B,
                        
                        output [62 : 0] Sum
                );

        wire [61 : 0] operand2_extended;
        
        assign operand2_extended =  {53'b0, B};
        
        unsignedRippleCarryAdder62bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        