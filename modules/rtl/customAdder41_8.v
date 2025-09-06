module customAdder41_8(
                        input [40 : 0] A,
                        input [32 : 0] B,
                        
                        output [41 : 0] Sum
                );

        wire [40 : 0] operand2_extended;
        
        assign operand2_extended =  {8'b0, B};
        
        unsignedRippleCarryAdder41bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        