module customAdder59_10(
                        input [58 : 0] A,
                        input [48 : 0] B,
                        
                        output [59 : 0] Sum
                );

        wire [58 : 0] operand2_extended;
        
        assign operand2_extended =  {10'b0, B};
        
        unsignedRippleCarryAdder59bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        