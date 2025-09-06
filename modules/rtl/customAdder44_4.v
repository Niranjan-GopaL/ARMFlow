module customAdder44_4(
                        input [43 : 0] A,
                        input [39 : 0] B,
                        
                        output [44 : 0] Sum
                );

        wire [43 : 0] operand2_extended;
        
        assign operand2_extended =  {4'b0, B};
        
        unsignedRippleCarryAdder44bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        