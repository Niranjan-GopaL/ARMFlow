'''
Author: Bhargav D V, Research Scholar, IIITB, under Prof.Madhav Rao
This script is used to generate non-recursive multiplier architectures and respective synthesized netlist
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

def changeModuleName(file_path, old_name, new_name):
    try:
        # Open the Verilog file for reading
        with open(file_path, 'r') as file:
            lines = file.readlines()

        # Replace the old module name with the new one
        with open(file_path, 'w') as file:
            for line in lines:
                # Replace only the module declaration line
                if line.strip().startswith(f"module {old_name}"):
                    line = line.replace(f"module {old_name}", f"module {new_name}")
                file.write(line)

        print(f"Module name '{old_name}' successfully changed to '{new_name}' in {file_path}.")
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
    except Exception as e:
        print(f"An error occurred: {e}")



def generateNetlist(design):
    YOSYS_SCRIPT="""
#---------------- yosys commands -------------------
#import yosys environment
yosys -import


#read verilog design file
read_verilog ../modules/rtl/{}.v
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
""".format(design,design,LIBERTY_FILE,design)

    #write the yosys script
    yosysFile=open('yosys_script.tcl',mode='w',encoding='utf-8')
    yosysFile.write(YOSYS_SCRIPT)
    yosysFile.close()


    os.system('yosys -c yosys_script.tcl')
    os.system('rm yosys_script.tcl')

def generate():

    #Use For Loops to generate the pair of operand bit sizes.
    for i in range(2,N+1):
        for j in range(2,N+1):
            # Start the interactive tool
            #input('press')
            process = subprocess.Popen(
                ["./genmul"],  # Replace with your tool's command
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            # Send inputs to the tool
            inputs = "1\n1\n1\n{}\n{}\n".format(str(i),str(j))
            stdout, stderr = process.communicate(inputs)


            # Check for any errors
            if stderr:
                print("Errors:")
                print(stderr)


            fileName='{}_{}_{}_SP_AR_RC_GenMul.v'.format(str(i),str(j),TYPE)
            changeModuleName(fileName, 'Mult_{}_{}'.format(str(i),str(j)), 'NR_{}_{}'.format(str(i),str(j)))


            os.system('mv {}_{}_{}_SP_AR_RC_GenMul.v ../modules/rtl/NR_{}_{}.v'.format(str(i),str(j),str(TYPE),str(i),str(j)))

            generateNetlist('NR_{}_{}'.format(str(i),str(j)))


            print('Generated netlist for '+'NR_{}_{}'.format(str(i),str(j)))

            


if(__name__=="__main__"):
    generate()