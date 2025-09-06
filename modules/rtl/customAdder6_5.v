
module customAdder6_5(
                    input [5 : 0] A,
                    input [0 : 0] B,
                    
                    output [6 : 0] Sum
            );

    wire [5 : 0] operand2_extended;
    
    assign operand2_extended =  {5'b0, B};
    
    unsignedRippleCarryAdder6bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        