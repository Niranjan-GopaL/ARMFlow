
module customAdder20_4(
                    input [19 : 0] A,
                    input [15 : 0] B,
                    
                    output [20 : 0] Sum
            );

    wire [19 : 0] operand2_extended;
    
    assign operand2_extended =  {4'b0, B};
    
    unsignedRippleCarryAdder20bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        