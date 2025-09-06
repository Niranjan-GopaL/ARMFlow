
module customAdder26_7(
                    input [25 : 0] A,
                    input [18 : 0] B,
                    
                    output [26 : 0] Sum
            );

    wire [25 : 0] operand2_extended;
    
    assign operand2_extended =  {7'b0, B};
    
    unsignedRippleCarryAdder26bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        