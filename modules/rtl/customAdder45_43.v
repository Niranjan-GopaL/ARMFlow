module customAdder45_43(
                        input [44 : 0] A,
                        input [1 : 0] B,
                        
                        output [45 : 0] Sum
                );

        wire [44 : 0] operand2_extended;
        
        assign operand2_extended =  {43'b0, B};
        
        unsignedRippleCarryAdder45bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        