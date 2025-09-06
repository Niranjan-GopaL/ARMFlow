module customAdder25_25(
                        input [24 : 0] A,
                        input [-1 : 0] B,
                        
                        output [25 : 0] Sum
                );

        wire [24 : 0] operand2_extended;
        
        assign operand2_extended =  {25'b0, B};
        
        unsignedRippleCarryAdder25bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        