
module customAdder29_21(
                    input [28 : 0] A,
                    input [7 : 0] B,
                    
                    output [29 : 0] Sum
            );

    wire [28 : 0] operand2_extended;
    
    assign operand2_extended =  {21'b0, B};
    
    unsignedRippleCarryAdder29bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        