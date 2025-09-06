
module customAdder3_1(
                    input [2 : 0] A,
                    input [1 : 0] B,
                    
                    output [3 : 0] Sum
            );

    wire [2 : 0] operand2_extended;
    
    assign operand2_extended =  {1'b0, B};
    
    unsignedRippleCarryAdder3bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        