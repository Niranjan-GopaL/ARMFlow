module customAdder48_35(
                        input [47 : 0] A,
                        input [12 : 0] B,
                        
                        output [48 : 0] Sum
                );

        wire [47 : 0] operand2_extended;
        
        assign operand2_extended =  {35'b0, B};
        
        unsignedRippleCarryAdder48bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        