
module customAdder30_5(
                    input [29 : 0] A,
                    input [24 : 0] B,
                    
                    output [30 : 0] Sum
            );

    wire [29 : 0] operand2_extended;
    
    assign operand2_extended =  {5'b0, B};
    
    unsignedRippleCarryAdder30bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        