module customAdder56_19(
                        input [55 : 0] A,
                        input [36 : 0] B,
                        
                        output [56 : 0] Sum
                );

        wire [55 : 0] operand2_extended;
        
        assign operand2_extended =  {19'b0, B};
        
        unsignedRippleCarryAdder56bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        