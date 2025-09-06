module customAdder58_7(
                        input [57 : 0] A,
                        input [50 : 0] B,
                        
                        output [58 : 0] Sum
                );

        wire [57 : 0] operand2_extended;
        
        assign operand2_extended =  {7'b0, B};
        
        unsignedRippleCarryAdder58bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        