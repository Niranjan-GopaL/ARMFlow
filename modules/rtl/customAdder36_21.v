module customAdder36_21(
                        input [35 : 0] A,
                        input [14 : 0] B,
                        
                        output [36 : 0] Sum
                );

        wire [35 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder36bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        