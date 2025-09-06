
module customAdder21_8(
                    input [20 : 0] A,
                    input [12 : 0] B,
                    
                    output [21 : 0] Sum
            );

    wire [20 : 0] operand2_extended;
    
    assign operand2_extended =  {8'b0, B};
    
    unsignedRippleCarryAdder21bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        