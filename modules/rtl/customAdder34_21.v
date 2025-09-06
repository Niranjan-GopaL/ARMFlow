module customAdder34_21(
                        input [33 : 0] A,
                        input [12 : 0] B,
                        
                        output [34 : 0] Sum
                );

        wire [33 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder34bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        