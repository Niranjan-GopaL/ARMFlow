
module customAdder11_2(
                    input [10 : 0] A,
                    input [8 : 0] B,
                    
                    output [11 : 0] Sum
            );

    wire [10 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder11bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        