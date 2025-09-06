
module customAdder3_2(
                    input [2 : 0] A,
                    input [0 : 0] B,
                    
                    output [3 : 0] Sum
            );

    wire [2 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder3bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        