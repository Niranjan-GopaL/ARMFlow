module customAdder62_58(
                        input [61 : 0] A,
                        input [3 : 0] B,
                        
                        output [62 : 0] Sum
                );

        wire [61 : 0] operand2_extended;
        
        assign operand2_extended =  {58'b0, B};
        
        unsignedRippleCarryAdder62bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        