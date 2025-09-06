module customAdder35_31(
                        input [34 : 0] A,
                        input [3 : 0] B,
                        
                        output [35 : 0] Sum
                );

        wire [34 : 0] operand2_extended;
        
        assign operand2_extended =  {31'b0, B};
        
        unsignedRippleCarryAdder35bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        