
module customAdder8_3(
                    input [7 : 0] A,
                    input [4 : 0] B,
                    
                    output [8 : 0] Sum
            );

    wire [7 : 0] operand2_extended;
    
    assign operand2_extended =  {3'b0, B};
    
    unsignedRippleCarryAdder8bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        