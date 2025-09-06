module customAdder38_23(
                        input [37 : 0] A,
                        input [14 : 0] B,
                        
                        output [38 : 0] Sum
                );

        wire [37 : 0] operand2_extended;
        
        assign operand2_extended =  {23'b0, B};
        
        unsignedRippleCarryAdder38bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        