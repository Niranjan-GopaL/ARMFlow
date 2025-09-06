
module customAdder27_9(
                    input [26 : 0] A,
                    input [17 : 0] B,
                    
                    output [27 : 0] Sum
            );

    wire [26 : 0] operand2_extended;
    
    assign operand2_extended =  {9'b0, B};
    
    unsignedRippleCarryAdder27bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        