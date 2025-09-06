module customAdder10_10(
                        input [9 : 0] A,
                        input [-1 : 0] B,
                        
                        output [10 : 0] Sum
                );

        wire [9 : 0] operand2_extended;
        
        assign operand2_extended =  {10'b0, B};
        
        unsignedRippleCarryAdder10bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        