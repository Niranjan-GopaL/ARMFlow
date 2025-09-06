
module customAdder26_11(
                    input [25 : 0] A,
                    input [14 : 0] B,
                    
                    output [26 : 0] Sum
            );

    wire [25 : 0] operand2_extended;
    
    assign operand2_extended =  {11'b0, B};
    
    unsignedRippleCarryAdder26bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        