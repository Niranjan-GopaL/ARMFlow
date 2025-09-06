module customAdder48_37(
                        input [47 : 0] A,
                        input [10 : 0] B,
                        
                        output [48 : 0] Sum
                );

        wire [47 : 0] operand2_extended;
        
        assign operand2_extended =  {37'b0, B};
        
        unsignedRippleCarryAdder48bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        