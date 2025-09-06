module customAdder39_31(
                        input [38 : 0] A,
                        input [7 : 0] B,
                        
                        output [39 : 0] Sum
                );

        wire [38 : 0] operand2_extended;
        
        assign operand2_extended =  {31'b0, B};
        
        unsignedRippleCarryAdder39bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        