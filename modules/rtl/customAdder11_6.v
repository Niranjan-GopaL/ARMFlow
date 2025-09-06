
module customAdder11_6(
                    input [10 : 0] A,
                    input [4 : 0] B,
                    
                    output [11 : 0] Sum
            );

    wire [10 : 0] operand2_extended;
    
    assign operand2_extended =  {6'b0, B};
    
    unsignedRippleCarryAdder11bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        