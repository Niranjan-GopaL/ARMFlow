
module customAdder16_4(
                    input [15 : 0] A,
                    input [11 : 0] B,
                    
                    output [16 : 0] Sum
            );

    wire [15 : 0] operand2_extended;
    
    assign operand2_extended =  {4'b0, B};
    
    unsignedRippleCarryAdder16bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        