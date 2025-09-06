
module customAdder19_3(
                    input [18 : 0] A,
                    input [15 : 0] B,
                    
                    output [19 : 0] Sum
            );

    wire [18 : 0] operand2_extended;
    
    assign operand2_extended =  {3'b0, B};
    
    unsignedRippleCarryAdder19bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        