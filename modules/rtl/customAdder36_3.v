module customAdder36_3(
                        input [35 : 0] A,
                        input [32 : 0] B,
                        
                        output [36 : 0] Sum
                );

        wire [35 : 0] operand2_extended;
        
        assign operand2_extended =  {3'b0, B};
        
        unsignedRippleCarryAdder36bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        