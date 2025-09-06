
module customAdder24_10(
                    input [23 : 0] A,
                    input [13 : 0] B,
                    
                    output [24 : 0] Sum
            );

    wire [23 : 0] operand2_extended;
    
    assign operand2_extended =  {10'b0, B};
    
    unsignedRippleCarryAdder24bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        