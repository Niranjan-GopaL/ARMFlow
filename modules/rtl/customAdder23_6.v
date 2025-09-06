
module customAdder23_6(
                    input [22 : 0] A,
                    input [16 : 0] B,
                    
                    output [23 : 0] Sum
            );

    wire [22 : 0] operand2_extended;
    
    assign operand2_extended =  {6'b0, B};
    
    unsignedRippleCarryAdder23bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        