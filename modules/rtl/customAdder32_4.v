
module customAdder32_4(
                    input [31 : 0] A,
                    input [27 : 0] B,
                    
                    output [32 : 0] Sum
            );

    wire [31 : 0] operand2_extended;
    
    assign operand2_extended =  {4'b0, B};
    
    unsignedRippleCarryAdder32bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        