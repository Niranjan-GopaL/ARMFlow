module customAdder20_20(
                        input [19 : 0] A,
                        input [-1 : 0] B,
                        
                        output [20 : 0] Sum
                );

        wire [19 : 0] operand2_extended;
        
        assign operand2_extended =  {20'b0, B};
        
        unsignedRippleCarryAdder20bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        