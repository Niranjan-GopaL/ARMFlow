module customAdder52_21(
                        input [51 : 0] A,
                        input [30 : 0] B,
                        
                        output [52 : 0] Sum
                );

        wire [51 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder52bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        