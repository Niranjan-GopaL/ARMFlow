module customAdder54_36(
                        input [53 : 0] A,
                        input [17 : 0] B,
                        
                        output [54 : 0] Sum
                );

        wire [53 : 0] operand2_extended;
        
        assign operand2_extended =  {36'b0, B};
        
        unsignedRippleCarryAdder54bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        