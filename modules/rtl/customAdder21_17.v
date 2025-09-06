
module customAdder21_17(
                    input [20 : 0] A,
                    input [3 : 0] B,
                    
                    output [21 : 0] Sum
            );

    wire [20 : 0] operand2_extended;
    
    assign operand2_extended =  {17'b0, B};
    
    unsignedRippleCarryAdder21bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        