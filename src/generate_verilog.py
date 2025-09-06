import engine.config_gen as gc
import engine.config_name_gen as gcn
import engine.mult_dict_gen as gmd
import engine.mult_rr_body as oc
from globalVariables import MUTATION_VERBOSE

import os
from pprint import pprint

VERBOSE = 0
# Remove this Z from here...

def write_complete_verilog(multiplier, n_bits,design):

    module_name = gcn.generate_configuration_name(multiplier)
    # print("generating", module_name[0])
    
    mult_dict = gmd.parse_multiplier_string(module_name[0])
    if(MUTATION_VERBOSE):
        pprint(mult_dict)
    # def generate_config(config, code, key=(8, 8, 'rr', 0), topflag=True, name="lol"):
    
    topflag = True 
    code = ""      
    code, adder_list = oc.generate_config(config=mult_dict, code=code, key=(0, n_bits, n_bits, 'rr'), topflag=True, name=design) # Change the top module name here
        

    if VERBOSE : 
        if(MUTATION_VERBOSE):
            print(code)
    set_of_nr_multipliers = set(tuple(sublist) for sublist in gcn.list_of_nr_multipliers)
        
    return code, set_of_nr_multipliers, adder_list

