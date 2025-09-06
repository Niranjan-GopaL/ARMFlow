
module customAdder17_12(
                    input [16 : 0] A,
                    input [4 : 0] B,
                    
                    output [17 : 0] Sum
            );

    wire [16 : 0] operand2_extended;
    
    assign operand2_extended =  {12'b0, B};
    
    unsignedRippleCarryAdder17bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        