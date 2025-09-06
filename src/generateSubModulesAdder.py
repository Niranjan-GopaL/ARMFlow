'''
Author: Bhargav D V, Research Scholar, IIITB, under Prof.Madhav Rao
This script is used to generate adder and respective synthesized netlist
'''

#---------------import packages--------------#
import subprocess        
import os
from globalVariables import LIBERTY_FILE
#---------------import packages--------------#


#Max bit sizes
N=64

#Unsigned or Signed
TYPE='U'

def custom_adder(operand1, operand2, bit_width_1, bit_width_2):
    
    zero_bit_width = bit_width_1 - bit_width_2
    output_width = bit_width_1 + 1
    template = f'''
module customAdder{bit_width_1}_{zero_bit_width}(
                    input [{bit_width_1 - 1} : 0] {operand1},
                    input [{bit_width_2 - 1} : 0] {operand2},
                    
                    output [{output_width - 1} : 0] Sum
            );

    wire [{bit_width_1 - 1} : 0] operand2_extended;
    
    assign operand2_extended =  {{{zero_bit_width}'b0, {operand2}}};
    
    unsignedRippleCarryAdder{bit_width_1}bit adder_module(
        {operand1},
        operand2_extended,
        Sum
    );
    
endmodule
        '''
    return template




def generateNetlist(design,adderSize):
    YOSYS_SCRIPT="""
#---------------- yosys commands -------------------
#import yosys environment
yosys -import


#read verilog design file
read_verilog ../modules/rtl/{}.v
read_verilog ../modules/rtl/unsignedRippleCarryAdder{}bit.v

flatten
hierarchy -check -top {}
synth
renames -wire

opt

alumacc
techmap
extract_fa
techmap -map ../techmap/adderMap.v

yosys "proc"
fsm
opt
memory -nomap

opt
abc -liberty {}
#-script ../libFiles/abcSpeed.script

splitnets


opt_clean -purge



write_verilog -noattr ../modules/netlist/{}.v


#exit
exit


#---------------- yosys commands -------------------
""".format(design,str(adderSize),design,LIBERTY_FILE,design)

    #write the yosys script
    yosysFile=open('yosys_script.tcl',mode='w',encoding='utf-8')
    yosysFile.write(YOSYS_SCRIPT)
    yosysFile.close()


    os.system('yosys -c yosys_script.tcl')
    os.system('rm yosys_script.tcl')


def generateAdders(N,operand1,operand2):
    template = f'''
module customAdder{N}_{0}(
    input [{N - 1} : 0] {operand1},
    input [{N-1} : 0] {operand2},
    output [{N} : 0] Sum
);

    assign Sum = {operand1}+{operand2};

endmodule
'''
    return template

def generate():

    #Use For Loops to generate the pair of operand bit sizes.
    for i in range(1,N+1):
        for j in range(1,i+1):
            #input('press')
            verilogCode=custom_adder('A','B',i,j)
            #verilogCode=generateAdders(i,'A','B')

            
            file=open(f'../modules/rtl/customAdder{i}_{i-j}.v',mode='w',encoding='utf-8')
            file.write(verilogCode)
            file.close()


            generateNetlist(f'customAdder{i}_{i-j}',i)



            


if(__name__=="__main__"):
    generate()