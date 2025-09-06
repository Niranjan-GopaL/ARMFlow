module customAdder46_13(
                        input [45 : 0] A,
                        input [32 : 0] B,
                        
                        output [46 : 0] Sum
                );

        wire [45 : 0] operand2_extended;
        
        assign operand2_extended =  {13'b0, B};
        
        unsignedRippleCarryAdder46bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        