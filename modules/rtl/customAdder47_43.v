module customAdder47_43(
                        input [46 : 0] A,
                        input [3 : 0] B,
                        
                        output [47 : 0] Sum
                );

        wire [46 : 0] operand2_extended;
        
        assign operand2_extended =  {43'b0, B};
        
        unsignedRippleCarryAdder47bit adder_module(
            A,
            operand2_extended,
            Sum
        );
        
        endmodule
        