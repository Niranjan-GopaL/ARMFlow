module customAdder42_17(
                        input [41 : 0] A,
                        input [24 : 0] B,
                        
                        output [42 : 0] Sum
                );

        wire [41 : 0] operand2_extended;
        
        assign operand2_extended =  {17'b0, B};
        
        unsignedRippleCarryAdder42bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        