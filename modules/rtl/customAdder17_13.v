
module customAdder17_13(
                    input [16 : 0] A,
                    input [3 : 0] B,
                    
                    output [17 : 0] Sum
            );

    wire [16 : 0] operand2_extended;
    
    assign operand2_extended =  {13'b0, B};
    
    unsignedRippleCarryAdder17bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        