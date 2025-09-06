
module customAdder20_14(
                    input [19 : 0] A,
                    input [5 : 0] B,
                    
                    output [20 : 0] Sum
            );

    wire [19 : 0] operand2_extended;
    
    assign operand2_extended =  {14'b0, B};
    
    unsignedRippleCarryAdder20bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        