module customAdder62_55(
                        input [61 : 0] A,
                        input [6 : 0] B,
                        
                        output [62 : 0] Sum
                );

        wire [61 : 0] operand2_extended;
        
        assign operand2_extended =  {55'b0, B};
        
        unsignedRippleCarryAdder62bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        