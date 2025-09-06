module customAdder63_3(
                        input [62 : 0] A,
                        input [59 : 0] B,
                        
                        output [63 : 0] Sum
                );

        wire [62 : 0] operand2_extended;
        
        assign operand2_extended =  {3'b0, B};
        
        unsignedRippleCarryAdder63bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        