module customAdder52_49(
                        input [51 : 0] A,
                        input [2 : 0] B,
                        
                        output [52 : 0] Sum
                );

        wire [51 : 0] operand2_extended;
        
        assign operand2_extended =  {49'b0, B};
        
        unsignedRippleCarryAdder52bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        