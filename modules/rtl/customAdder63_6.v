module customAdder63_6(
                        input [62 : 0] A,
                        input [56 : 0] B,
                        
                        output [63 : 0] Sum
                );

        wire [62 : 0] operand2_extended;
        
        assign operand2_extended =  {6'b0, B};
        
        unsignedRippleCarryAdder63bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        