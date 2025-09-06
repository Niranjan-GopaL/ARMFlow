module customAdder19_19(
                        input [18 : 0] A,
                        input [-1 : 0] B,
                        
                        output [19 : 0] Sum
                );

        wire [18 : 0] operand2_extended;
        
        assign operand2_extended =  {19'b0, B};
        
        unsignedRippleCarryAdder19bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        