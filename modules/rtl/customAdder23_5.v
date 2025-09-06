
module customAdder23_5(
                    input [22 : 0] A,
                    input [17 : 0] B,
                    
                    output [23 : 0] Sum
            );

    wire [22 : 0] operand2_extended;
    
    assign operand2_extended =  {5'b0, B};
    
    unsignedRippleCarryAdder23bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        