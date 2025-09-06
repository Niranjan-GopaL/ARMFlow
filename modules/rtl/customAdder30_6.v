
module customAdder30_6(
                    input [29 : 0] A,
                    input [23 : 0] B,
                    
                    output [30 : 0] Sum
            );

    wire [29 : 0] operand2_extended;
    
    assign operand2_extended =  {6'b0, B};
    
    unsignedRippleCarryAdder30bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        