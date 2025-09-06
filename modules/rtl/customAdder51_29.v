module customAdder51_29(
                        input [50 : 0] A,
                        input [21 : 0] B,
                        
                        output [51 : 0] Sum
                );

        wire [50 : 0] operand2_extended;
        
        assign operand2_extended =  {29'b0, B};
        
        unsignedRippleCarryAdder51bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        