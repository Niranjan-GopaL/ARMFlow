module customAdder57_25(
                        input [56 : 0] A,
                        input [31 : 0] B,
                        
                        output [57 : 0] Sum
                );

        wire [56 : 0] operand2_extended;
        
        assign operand2_extended =  {25'b0, B};
        
        unsignedRippleCarryAdder57bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        