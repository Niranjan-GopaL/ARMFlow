module customAdder56_1(
                        input [55 : 0] A,
                        input [54 : 0] B,
                        
                        output [56 : 0] Sum
                );

        wire [55 : 0] operand2_extended;
        
        assign operand2_extended =  {1'b0, B};
        
        unsignedRippleCarryAdder56bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        