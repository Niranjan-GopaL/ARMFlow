
module customAdder24_15(
                    input [23 : 0] A,
                    input [8 : 0] B,
                    
                    output [24 : 0] Sum
            );

    wire [23 : 0] operand2_extended;
    
    assign operand2_extended =  {15'b0, B};
    
    unsignedRippleCarryAdder24bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        