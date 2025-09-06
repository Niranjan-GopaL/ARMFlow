
module customAdder5_2(
                    input [4 : 0] A,
                    input [2 : 0] B,
                    
                    output [5 : 0] Sum
            );

    wire [4 : 0] operand2_extended;
    
    assign operand2_extended =  {2'b0, B};
    
    unsignedRippleCarryAdder5bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        