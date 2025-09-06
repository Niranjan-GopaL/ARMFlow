module customAdder44_36(
                        input [43 : 0] A,
                        input [7 : 0] B,
                        
                        output [44 : 0] Sum
                );

        wire [43 : 0] operand2_extended;
        
        assign operand2_extended =  {36'b0, B};
        
        unsignedRippleCarryAdder44bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        