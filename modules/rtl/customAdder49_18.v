module customAdder49_18(
                        input [48 : 0] A,
                        input [30 : 0] B,
                        
                        output [49 : 0] Sum
                );

        wire [48 : 0] operand2_extended;
        
        assign operand2_extended =  {18'b0, B};
        
        unsignedRippleCarryAdder49bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        