module customAdder60_29(
                        input [59 : 0] A,
                        input [30 : 0] B,
                        
                        output [60 : 0] Sum
                );

        wire [59 : 0] operand2_extended;
        
        assign operand2_extended =  {29'b0, B};
        
        unsignedRippleCarryAdder60bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        