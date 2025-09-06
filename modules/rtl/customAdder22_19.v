
module customAdder22_19(
                    input [21 : 0] A,
                    input [2 : 0] B,
                    
                    output [22 : 0] Sum
            );

    wire [21 : 0] operand2_extended;
    
    assign operand2_extended =  {19'b0, B};
    
    unsignedRippleCarryAdder22bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        