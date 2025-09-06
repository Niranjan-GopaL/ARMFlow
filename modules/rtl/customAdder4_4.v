module customAdder4_4(
                        input [3 : 0] A,
                        input [-1 : 0] B,
                        
                        output [4 : 0] Sum
                );

        wire [3 : 0] operand2_extended;
        
        assign operand2_extended =  {4'b0, B};
        
        unsignedRippleCarryAdder4bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        