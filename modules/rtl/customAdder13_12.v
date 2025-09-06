
module customAdder13_12(
                    input [12 : 0] A,
                    input [0 : 0] B,
                    
                    output [13 : 0] Sum
            );

    wire [12 : 0] operand2_extended;
    
    assign operand2_extended =  {12'b0, B};
    
    unsignedRippleCarryAdder13bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        