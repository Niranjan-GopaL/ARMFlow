module customAdder57_21(
                        input [56 : 0] A,
                        input [35 : 0] B,
                        
                        output [57 : 0] Sum
                );

        wire [56 : 0] operand2_extended;
        
        assign operand2_extended =  {21'b0, B};
        
        unsignedRippleCarryAdder57bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        