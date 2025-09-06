module customAdder52_6(
                        input [51 : 0] A,
                        input [45 : 0] B,
                        
                        output [52 : 0] Sum
                );

        wire [51 : 0] operand2_extended;
        
        assign operand2_extended =  {6'b0, B};
        
        unsignedRippleCarryAdder52bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        