module customAdder23_23(
                        input [22 : 0] A,
                        input [-1 : 0] B,
                        
                        output [23 : 0] Sum
                );

        wire [22 : 0] operand2_extended;
        
        assign operand2_extended =  {23'b0, B};
        
        unsignedRippleCarryAdder23bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        