module customAdder2_2(
                        input [1 : 0] A,
                        input [-1 : 0] B,
                        
                        output [2 : 0] Sum
                );

        wire [1 : 0] operand2_extended;
        
        assign operand2_extended =  {2'b0, B};
        
        unsignedRippleCarryAdder2bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        