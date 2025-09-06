module customAdder58_27(
                        input [57 : 0] A,
                        input [30 : 0] B,
                        
                        output [58 : 0] Sum
                );

        wire [57 : 0] operand2_extended;
        
        assign operand2_extended =  {27'b0, B};
        
        unsignedRippleCarryAdder58bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        