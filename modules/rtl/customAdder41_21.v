module customAdder41_21(
                        input [40 : 0] A,
                        input [19 : 0] B,
                        
                        output [41 : 0] Sum
                );

        wire [40 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder41bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        