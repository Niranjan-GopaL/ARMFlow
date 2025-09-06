module customAdder61_15(
                        input [60 : 0] A,
                        input [45 : 0] B,
                        
                        output [61 : 0] Sum
                );

        wire [60 : 0] operand2_extended;
        
        assign operand2_extended =  {15'b0, B};
        
        unsignedRippleCarryAdder61bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        