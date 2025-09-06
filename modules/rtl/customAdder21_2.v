
module customAdder21_2(
                    input [20 : 0] A,
                    input [18 : 0] B,
                    
                    output [21 : 0] Sum
            );

    wire [20 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder21bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        