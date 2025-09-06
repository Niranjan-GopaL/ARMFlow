
module customAdder14_6(
                    input [13 : 0] A,
                    input [7 : 0] B,
                    
                    output [14 : 0] Sum
            );

    wire [13 : 0] operand2_extended;
    
    assign operand2_extended =  {6'b0, B};
    
    unsignedRippleCarryAdder14bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        