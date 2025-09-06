module customAdder26_26(
                        input [25 : 0] A,
                        input [-1 : 0] B,
                        
                        output [26 : 0] Sum
                );

        wire [25 : 0] operand2_extended;
        
        assign operand2_extended =  {26'b0, B};
        
        unsignedRippleCarryAdder26bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        