
module customAdder10_1(
                    input [9 : 0] A,
                    input [8 : 0] B,
                    
                    output [10 : 0] Sum
            );

    wire [9 : 0] operand2_extended;
    
    assign operand2_extended =  {1'b0, B};
    
    unsignedRippleCarryAdder10bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        