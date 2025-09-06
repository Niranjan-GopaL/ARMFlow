
module customAdder12_3(
                    input [11 : 0] A,
                    input [8 : 0] B,
                    
                    output [12 : 0] Sum
            );

    wire [11 : 0] operand2_extended;
    
    assign operand2_extended =  {3'b0, B};
    
    unsignedRippleCarryAdder12bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        