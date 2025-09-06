module customAdder49_21(
                        input [48 : 0] A,
                        input [27 : 0] B,
                        
                        output [49 : 0] Sum
                );

        wire [48 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder49bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        