
module customAdder9_8(
                    input [8 : 0] A,
                    input [0 : 0] B,
                    
                    output [9 : 0] Sum
            );

    wire [8 : 0] operand2_extended;
    
    assign operand2_extended =  {8'b0, B};
    
    unsignedRippleCarryAdder9bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        