module customAdder60_38(
                        input [59 : 0] A,
                        input [21 : 0] B,
                        
                        output [60 : 0] Sum
                );

        wire [59 : 0] operand2_extended;
        
        assign operand2_extended =  {38'b0, B};
        
        unsignedRippleCarryAdder60bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        