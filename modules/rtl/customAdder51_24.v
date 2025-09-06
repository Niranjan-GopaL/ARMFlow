module customAdder51_24(
                        input [50 : 0] A,
                        input [26 : 0] B,
                        
                        output [51 : 0] Sum
                );

        wire [50 : 0] operand2_extended;
        
        assign operand2_extended =  {24'b0, B};
        
        unsignedRippleCarryAdder51bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        