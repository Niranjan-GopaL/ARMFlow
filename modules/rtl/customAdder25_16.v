
module customAdder25_16(
                    input [24 : 0] A,
                    input [8 : 0] B,
                    
                    output [25 : 0] Sum
            );

    wire [24 : 0] operand2_extended;
    
    assign operand2_extended =  {16'b0, B};
    
    unsignedRippleCarryAdder25bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        