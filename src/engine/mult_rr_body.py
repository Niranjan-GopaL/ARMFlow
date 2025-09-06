from pprint import pprint
# import sys
from globalVariables import *


def write_main_verilog(top_nature, top_index, size_x, hi, lo, M1_nature, M1_index, M2_nature, M2_index, M3_nature, M3_index, M4_nature, M4_index, size_11, size_12, size_21, size_22, size_31, size_32, size_41, size_42, topflag, name="lol"):
    

    adder_set = set()

    p1 = 2*hi-1 if hi != 1 else 0
    p2_3 = hi+lo-1 if hi != 1 and lo != 1 else max(hi, lo)-1
    p4 = 2*lo-1 if lo != 1 else 0
    # p2_3 = hi+lo-1
    # p1 = 2*hi-1
    # p4 = 2*lo-1
    
    
    #o1 = 2*hi+lo
    o1 = p1 + 1 + lo
    #o2 = hi+lo+1
    o2 = p2_3 + 1
    zeros = o1-o2-1

    adder_set.add((o2,0))
    adder_set.add((o1,zeros))
    
    if M1_nature == "rr":
        M1_Name = f"{M1_nature}_{size_11}x{size_12}_{M1_index}"
    else:
        M1_Name = f"{M1_nature}_{size_11}_{size_12}"
        
    if M2_nature == "rr":
        M2_Name = f"{M2_nature}_{size_21}x{size_22}_{M2_index}"
    else:
        M2_Name = f"{M2_nature}_{size_21}_{size_22}"
        
    if M3_nature == "rr":
        M3_Name = f"{M3_nature}_{size_31}x{size_32}_{M3_index}"
    else:
        M3_Name = f"{M3_nature}_{size_31}_{size_32}"
        
    if M4_nature == "rr":
        M4_Name = f"{M4_nature}_{size_41}x{size_42}_{M4_index}"
    else:
        M4_Name = f"{M4_nature}_{size_41}_{size_42}"
        
        
    p4_h_val = f"P4[{p4}:{lo}]" if lo!=1 else "1'b0"
    if topflag == False:
        template = f'''
module {top_nature}_{size_x}x{size_x}_{top_index}(
    input [{size_x-1}:0] A, 
    input [{size_x-1}:0] B, 
    output [{2*size_x - 1}:0] P
);
    
    wire [{hi-1}:0] A_H, B_H;
    wire [{lo-1}:0] A_L, B_L;
    
    assign A_H = A[{size_x-1}:{size_x-hi}];
    assign B_H = B[{size_x-1}:{size_x-hi}];
    assign A_L = A[{lo-1}:0];
    assign B_L = B[{lo-1}:0];
    
    wire [{p1}:0] P1;
    wire [{p2_3}:0] P2, P3;
    wire [{p4}:0] P4;
    
    {M1_Name} M1(A_H, B_H, P1);
    {M2_Name} M2(A_H, B_L, P2);
    {M3_Name} M3(A_L, B_H, P3);
    {M4_Name} M4(A_L, B_L, P4);
    
    wire[{lo-1}:0] P4_L;
    wire[{lo-1}:0] P4_H;

    wire[{o1-1}:0] operand1;
    wire[{o2}:0] operand2;
    wire[{(o1+1)-1}:0] out;
    
    assign P4_L = P4[{lo-1}:0];
    assign P4_H = {p4_h_val};
    assign operand1 = {{P1,P4_H}};

    customAdder{o2}_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder{o1}_{zeros} adder2(
        operand1,
        operand2,
        out
    );
    assign P = {{out[{o1-1 if zeros!=0 else o1}:0],P4_L}};
endmodule
        '''
    else:
        template = f'''
module {name}(
    input [{size_x-1}:0] A, 
    input [{size_x-1}:0] B, 
    output [{2*size_x - 1}:0] P
);
    
    wire [{hi-1}:0] A_H, B_H;
    wire [{lo-1}:0] A_L, B_L;
    
    assign A_H = A[{size_x-1}:{size_x-hi}];
    assign B_H = B[{size_x-1}:{size_x-hi}];
    assign A_L = A[{lo-1}:0];
    assign B_L = B[{lo-1}:0];
    
    
    wire [{p1}:0] P1;
    wire [{p2_3}:0] P2, P3;
    wire [{p4}:0] P4;
    
    {M1_Name} M1(A_H, B_H, P1);
    {M2_Name} M2(A_H, B_L, P2);
    {M3_Name} M3(A_L, B_H, P3);
    {M4_Name} M4(A_L, B_L, P4);
    
    wire[{lo-1}:0] P4_L;
    wire[{lo-1}:0] P4_H;

    wire[{o1-1}:0] operand1;
    wire[{o2}:0] operand2;
    wire[{(o1+1)-1}:0] out;
    
    assign P4_L = P4[{lo-1}:0];
    assign P4_H = {p4_h_val};
    assign operand1 = {{P1,P4_H}};

    customAdder{o2}_0 adder1(
        P2,
        P3,
        operand2
    );

    customAdder{o1}_{zeros} adder2(
        operand1,
        operand2,
        out
    );
    assign P = {{out[{o1-1 if zeros!=0 else o1}:0],P4_L}};
endmodule
        '''
        
    
    return template, adder_set

# code = ""

def generate_config_recursive(config, code, key, topflag, name, adder_list):
    
    # global code
    # code = ""
    # print("Printing")
    # pprint(config)
    # print(f"Key={key}")
    
    if key[3] == 'NR':
        return
    
    # print(key, config)
    new_config_full = config[key]
    new_config = {key: [keys for keys in config[key]]}
    # print(new_config)
                
    # Extracting all the parameters
    top_nature = key[3]
    
    size_x = key[1]
    if(MUTATION_VERBOSE):
        print(f"Size_x={size_x}")
    
    top_index = key[0]
    
    hi = new_config[key][0][1]
    lo = size_x - hi
    
    M1_nature = new_config[key][0][3]
    M2_nature = new_config[key][1][3]
    M3_nature = new_config[key][2][3]
    M4_nature = new_config[key][3][3]
    
    M1_index = new_config[key][0][0]
    M2_index = new_config[key][1][0]
    M3_index = new_config[key][2][0]
    M4_index = new_config[key][3][0]
    
    size_11 = new_config[key][0][1]
    size_12 = new_config[key][0][2]
    
    size_21 = new_config[key][1][1]
    size_22 = new_config[key][1][2]
    
    size_31 = new_config[key][2][1]
    size_32 = new_config[key][2][2]
    
    size_41 = new_config[key][3][1]
    size_42 = new_config[key][3][2]
    
    code, new_adders = write_main_verilog(top_nature, top_index, size_x, hi, lo, M1_nature, M1_index, M2_nature, M2_index, M3_nature, M3_index, M4_nature, M4_index, size_11, size_12, size_21, size_22, size_31, size_32, size_41, size_42, topflag, name)
    # print(f"Code={code}")

    for adders in list(new_adders):
        adder_list.add(adders)

    if topflag == True:
        topflag = False
    
    for values in new_config[key]:
        code_1 = generate_config_recursive(new_config_full, code, values, topflag, name, adder_list)
        if code_1 != None:
            code += code_1
    
    return code
    
# Change this to NBITS
def generate_config(config, code, key=(0, N_BITS, N_BITS, 'rr'), topflag=True, name="lol"):

    adder_list = set()
    
    code = generate_config_recursive(config, code, key, topflag, name, adder_list)
    
    return code, list(adder_list)
    
    
def main():
    
    config = {(0, 64, 64, 'rr'): {(1, 27, 27, 'rr'): {(2, 19, 19, 'rr'): {(3, 16, 16, 'rr'): {(4, 13, 13, 'rr'): {(5, 7, 7, 'rr'): {(6, 5, 5, 'rr'): {(7, 2, 2, 'nr'): {},
                                                                                                                                         (8, 2, 3, 'nr'): {},
                                                                                                                                         (9, 3, 2, 'nr'): {},
                                                                                                                                         (10, 3, 3, 'rr'): {(11, 1, 1, 'nr'): {},
                                                                                                                                                            (12, 1, 2, 'nr'): {},
                                                                                                                                                            (13, 2, 1, 'nr'): {},
                                                                                                                                                            (14, 2, 2, 'nr'): {}}},
                                                                                                                       (15, 5, 2, 'nr'): {},
                                                                                                                       (16, 2, 5, 'nr'): {},
                                                                                                                       (17, 2, 2, 'nr'): {}},
                                                                                                     (18, 7, 6, 'nr'): {},
                                                                                                     (19, 6, 7, 'nr'): {},
                                                                                                     (20, 6, 6, 'rr'): {(21, 1, 1, 'nr'): {},
                                                                                                                        (22, 1, 5, 'nr'): {},
                                                                                                                        (23, 5, 1, 'nr'): {},
                                                                                                                        (24, 5, 5, 'nr'): {}}},
                                                                                 (25, 13, 3, 'nr'): {},
                                                                                 (26, 3, 13, 'nr'): {},
                                                                                 (27, 3, 3, 'rr'): {(28, 1, 1, 'nr'): {},
                                                                                                    (29, 1, 2, 'nr'): {},
                                                                                                    (30, 2, 1, 'nr'): {},
                                                                                                    (31, 2, 2, 'nr'): {}}},
                                                             (32, 16, 3, 'nr'): {},
                                                             (33, 3, 16, 'nr'): {},
                                                             (34, 3, 3, 'nr'): {}},
                                         (35, 19, 8, 'nr'): {},
                                         (36, 8, 19, 'nr'): {},
                                         (37, 8, 8, 'nr'): {}},
                     (38, 27, 37, 'nr'): {},
                     (39, 37, 27, 'nr'): {},
                     (40, 37, 37, 'rr'): {(41, 19, 19, 'rr'): {(42, 13, 13, 'nr'): {},
                                                               (43, 13, 6, 'nr'): {},
                                                               (44, 6, 13, 'nr'): {},
                                                               (45, 6, 6, 'rr'): {(46, 3, 3, 'nr'): {},
                                                                                  (47, 3, 3, 'nr'): {},
                                                                                  (48, 3, 3, 'nr'): {},
                                                                                  (49, 3, 3, 'nr'): {}}},
                                          (50, 19, 18, 'nr'): {},
                                          (51, 18, 19, 'nr'): {},
                                          (52, 18, 18, 'rr'): {(53, 11, 11, 'nr'): {},
                                                               (54, 11, 7, 'nr'): {},
                                                               (55, 7, 11, 'nr'): {},
                                                               (56, 7, 7, 'rr'): {(57, 5, 5, 'nr'): {},
                                                                                  (58, 5, 2, 'nr'): {},
                                                                                  (59, 2, 5, 'nr'): {},
                                                                                  (60, 2, 2, 'nr'): {}}}}}}
     
    topflag = True                                 
    # while True:
        
    #     tval = False
    #     for key in config:
    #         print("Key=", key)
    #         pprint(config)
    #         if key[2] == "rr":
    #             new_config = {key: [keys for keys in config[key]]}
                
    #             # Extracting all the parameters
    #             top_nature = key[2]
                
    #             size_x = key[0]
                
    #             hi = new_config[key][0][0]
    #             lo = size_x - hi
                
    #             M1_nature = new_config[key][0][2]
    #             M2_nature = new_config[key][1][2]
    #             M3_nature = new_config[key][2][2]
    #             M4_nature = new_config[key][3][2]
                
    #             size_11 = new_config[key][0][0]
    #             size_12 = new_config[key][0][1]
                
    #             size_21 = new_config[key][1][0]
    #             size_22 = new_config[key][1][1]
                
    #             size_31 = new_config[key][2][0]
    #             size_32 = new_config[key][2][1]
                
    #             size_41 = new_config[key][3][0]
    #             size_42 = new_config[key][3][1]
                
    #             code += write_main_verilog(top_nature, size_x, hi, lo, M1_nature, M2_nature, M3_nature, M4_nature, size_11, size_12, size_21, size_22, size_31, size_32, size_41, size_42, topflag)
    #             topflag = False
                
    #             config = config[key]
    #             tval = True
    #     if tval == False:
    #         break
    code = ""
    code, adder_list = generate_config(config=config, key=(0, 64, 64, 'rr'), topflag=True, name="lol", code=code)
    # code = generate_config_recursive(config=config, key=(8, 8, 'rr', 0), topflag=True, name="lol", code=code)
    if(MUTATION_VERBOSE):
        print(code)
        print(adder_list)
    
if __name__ == "__main__":
    main()