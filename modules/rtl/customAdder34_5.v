module customAdder34_5(
                        input [33 : 0] A,
                        input [28 : 0] B,
                        
                        output [34 : 0] Sum
                );

        wire [33 : 0] operand2_extended;
        
        assign operand2_extended =  {5'b0, B};
        
        unsignedRippleCarryAdder34bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        