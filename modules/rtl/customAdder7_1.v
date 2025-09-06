
module customAdder7_1(
                    input [6 : 0] A,
                    input [5 : 0] B,
                    
                    output [7 : 0] Sum
            );

    wire [6 : 0] operand2_extended;
    
    assign operand2_extended =  {1'b0, B};
    
    unsignedRippleCarryAdder7bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        