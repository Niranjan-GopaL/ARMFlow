module customAdder64_38(
                        input [63 : 0] A,
                        input [25 : 0] B,
                        
                        output [64 : 0] Sum
                );

        wire [63 : 0] operand2_extended;
        
        assign operand2_extended =  {38'b0, B};
        
        unsignedRippleCarryAdder64bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        