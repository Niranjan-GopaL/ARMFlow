module customAdder40_11(
                        input [39 : 0] A,
                        input [28 : 0] B,
                        
                        output [40 : 0] Sum
                );

        wire [39 : 0] operand2_extended;
        
        assign operand2_extended =  {11'b0, B};
        
        unsignedRippleCarryAdder40bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        