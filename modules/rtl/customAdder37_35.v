module customAdder37_35(
                        input [36 : 0] A,
                        input [1 : 0] B,
                        
                        output [37 : 0] Sum
                );

        wire [36 : 0] operand2_extended;
        
        assign operand2_extended =  {35'b0, B};
        
        unsignedRippleCarryAdder37bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        