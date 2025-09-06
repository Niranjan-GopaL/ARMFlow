module customAdder57_24(
                        input [56 : 0] A,
                        input [32 : 0] B,
                        
                        output [57 : 0] Sum
                );

        wire [56 : 0] operand2_extended;
        
        assign operand2_extended =  {24'b0, B};
        
        unsignedRippleCarryAdder57bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        