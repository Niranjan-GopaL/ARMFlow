
module customAdder28_15(
                    input [27 : 0] A,
                    input [12 : 0] B,
                    
                    output [28 : 0] Sum
            );

    wire [27 : 0] operand2_extended;
    
    assign operand2_extended =  {15'b0, B};
    
    unsignedRippleCarryAdder28bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        