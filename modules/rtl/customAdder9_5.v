
module customAdder9_5(
                    input [8 : 0] A,
                    input [3 : 0] B,
                    
                    output [9 : 0] Sum
            );

    wire [8 : 0] operand2_extended;
    
    assign operand2_extended =  {5'b0, B};
    
    unsignedRippleCarryAdder9bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        