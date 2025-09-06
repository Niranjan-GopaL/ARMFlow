module customAdder34_13(
                        input [33 : 0] A,
                        input [20 : 0] B,
                        
                        output [34 : 0] Sum
                );

        wire [33 : 0] operand2_extended;
        
        assign operand2_extended =  {13'b0, B};
        
        unsignedRippleCarryAdder34bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        