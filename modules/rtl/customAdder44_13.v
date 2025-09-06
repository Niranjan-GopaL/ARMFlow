module customAdder44_13(
                        input [43 : 0] A,
                        input [30 : 0] B,
                        
                        output [44 : 0] Sum
                );

        wire [43 : 0] operand2_extended;
        
        assign operand2_extended =  {13'b0, B};
        
        unsignedRippleCarryAdder44bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        