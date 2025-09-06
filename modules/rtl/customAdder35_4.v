module customAdder35_4(
                        input [34 : 0] A,
                        input [30 : 0] B,
                        
                        output [35 : 0] Sum
                );

        wire [34 : 0] operand2_extended;
        
        assign operand2_extended =  {4'b0, B};
        
        unsignedRippleCarryAdder35bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        