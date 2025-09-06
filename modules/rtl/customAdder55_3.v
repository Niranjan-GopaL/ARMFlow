module customAdder55_3(
                        input [54 : 0] A,
                        input [51 : 0] B,
                        
                        output [55 : 0] Sum
                );

        wire [54 : 0] operand2_extended;
        
        assign operand2_extended =  {3'b0, B};
        
        unsignedRippleCarryAdder55bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        