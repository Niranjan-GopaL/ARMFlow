
module customAdder13_8(
                    input [12 : 0] A,
                    input [4 : 0] B,
                    
                    output [13 : 0] Sum
            );

    wire [12 : 0] operand2_extended;
    
    assign operand2_extended =  {8'b0, B};
    
    unsignedRippleCarryAdder13bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        