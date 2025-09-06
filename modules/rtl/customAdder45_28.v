module customAdder45_28(
                        input [44 : 0] A,
                        input [16 : 0] B,
                        
                        output [45 : 0] Sum
                );

        wire [44 : 0] operand2_extended;
        
        assign operand2_extended =  {28'b0, B};
        
        unsignedRippleCarryAdder45bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        