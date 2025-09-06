module customAdder56_10(
                        input [55 : 0] A,
                        input [45 : 0] B,
                        
                        output [56 : 0] Sum
                );

        wire [55 : 0] operand2_extended;
        
        assign operand2_extended =  {10'b0, B};
        
        unsignedRippleCarryAdder56bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        