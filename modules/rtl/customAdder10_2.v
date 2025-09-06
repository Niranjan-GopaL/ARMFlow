
module customAdder10_2(
                    input [9 : 0] A,
                    input [7 : 0] B,
                    
                    output [10 : 0] Sum
            );

    wire [9 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder10bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        