
module customAdder22_13(
                    input [21 : 0] A,
                    input [8 : 0] B,
                    
                    output [22 : 0] Sum
            );

    wire [21 : 0] operand2_extended;
    
    assign operand2_extended =  {13'b0, B};
    
    unsignedRippleCarryAdder22bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        