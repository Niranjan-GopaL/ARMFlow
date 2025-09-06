module customAdder40_21(
                        input [39 : 0] A,
                        input [18 : 0] B,
                        
                        output [40 : 0] Sum
                );

        wire [39 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder40bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        