
module customAdder17_14(
                    input [16 : 0] A,
                    input [2 : 0] B,
                    
                    output [17 : 0] Sum
            );

    wire [16 : 0] operand2_extended;
    
    assign operand2_extended =  {14'b0, B};
    
    unsignedRippleCarryAdder17bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        