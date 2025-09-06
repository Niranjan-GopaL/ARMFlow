
module customAdder8_2(
                    input [7 : 0] A,
                    input [5 : 0] B,
                    
                    output [8 : 0] Sum
            );

    wire [7 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder8bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        