module customAdder36_16(
                        input [35 : 0] A,
                        input [19 : 0] B,
                        
                        output [36 : 0] Sum
                );

        wire [35 : 0] operand2_extended;
        
        assign operand2_extended =  {16'b0, B};
        
        unsignedRippleCarryAdder36bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        