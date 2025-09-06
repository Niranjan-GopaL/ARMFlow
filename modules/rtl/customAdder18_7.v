
module customAdder18_7(
                    input [17 : 0] A,
                    input [10 : 0] B,
                    
                    output [18 : 0] Sum
            );

    wire [17 : 0] operand2_extended;
    
    assign operand2_extended =  {7'b0, B};
    
    unsignedRippleCarryAdder18bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        