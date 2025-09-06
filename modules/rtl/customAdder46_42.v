module customAdder46_42(
                        input [45 : 0] A,
                        input [3 : 0] B,
                        
                        output [46 : 0] Sum
                );

        wire [45 : 0] operand2_extended;
        
        assign operand2_extended =  {42'b0, B};
        
        unsignedRippleCarryAdder46bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        