module customAdder46_17(
                        input [45 : 0] A,
                        input [28 : 0] B,
                        
                        output [46 : 0] Sum
                );

        wire [45 : 0] operand2_extended;
        
        assign operand2_extended =  {17'b0, B};
        
        unsignedRippleCarryAdder46bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        