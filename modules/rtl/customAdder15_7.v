
module customAdder15_7(
                    input [14 : 0] A,
                    input [7 : 0] B,
                    
                    output [15 : 0] Sum
            );

    wire [14 : 0] operand2_extended;
    
    assign operand2_extended =  {7'b0, B};
    
    unsignedRippleCarryAdder15bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        