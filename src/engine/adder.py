def custom_adder(operand1, operand2, bit_width_1, bit_width_2):
    
    zero_bit_width = bit_width_1 - bit_width_2
    output_width = bit_width_1 + 1
    template = f'''module custom_Adder_{bit_width_1}_{zero_bit_width}(
                        input [{bit_width_1 - 1} : 0] {operand1},
                        input [{bit_width_2 - 1} : 0] {operand2},
                        
                        output [{output_width - 1} : 0] Sum
                );

        wire [{bit_width_1 - 1} : 0] operand2_extended;
        
        assign operand2_extended =  {{{zero_bit_width}'b0, operand2}};
        
        unsignedRippleCarryAdder{bit_width_1}bit adder_module(
            {operand1},
            operand2_extended,
            Sum
        );
        
        endmodule
        '''
    return template
    