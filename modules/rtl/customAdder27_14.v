
module customAdder27_14(
                    input [26 : 0] A,
                    input [12 : 0] B,
                    
                    output [27 : 0] Sum
            );

    wire [26 : 0] operand2_extended;
    
    assign operand2_extended =  {14'b0, B};
    
    unsignedRippleCarryAdder27bit adder_module(
        A,
        operand2_extended,
        Sum
    );
    
endmodule
        