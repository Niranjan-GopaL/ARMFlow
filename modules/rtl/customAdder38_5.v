module customAdder38_5(
                        input [37 : 0] A,
                        input [32 : 0] B,
                        
                        output [38 : 0] Sum
                );

        wire [37 : 0] operand2_extended;
        
        assign operand2_extended =  {5'b0, B};
        
        unsignedRippleCarryAdder38bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        