
module customAdder27_17(
                    input [26 : 0] A,
                    input [9 : 0] B,
                    
                    output [27 : 0] Sum
            );

    wire [26 : 0] operand2_extended;
    
    assign operand2_extended =  {17'b0, B};
    
    unsignedRippleCarryAdder27bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        