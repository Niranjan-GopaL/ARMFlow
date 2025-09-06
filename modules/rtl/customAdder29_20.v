
module customAdder29_20(
                    input [28 : 0] A,
                    input [8 : 0] B,
                    
                    output [29 : 0] Sum
            );

    wire [28 : 0] operand2_extended;
    
    assign operand2_extended =  {20'b0, B};
    
    unsignedRippleCarryAdder29bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        