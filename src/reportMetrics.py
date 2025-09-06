"""
Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
This script is used to generate Metrics for custom configuration
"""


#------------import modules----------------#
from optimizationUtils import determineDecisionVariableLimit
from pymoo.core.problem import Problem
from globalVariables import *
import numpy as np
import re
import os
from generate_verilog import write_complete_verilog
from config_validator import config_validator
from generate_final_config import generate_final_config
import subprocess
#------------import modules----------------#


#-------------- variables-----------------#
CONFIGURATION=[ 6, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
nbits=8
design='multiplier8bit'
#-------------- variables-----------------#

def runTCLScripts(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION):
    #print('Generating and running TCL scripts of yosys and OpenSTA.....')
    #yosys script
    
    yosys_file=open('./custom/yosys_script.tcl',mode='w',encoding='utf-8')
    yosys_file.write(YOSYS_SCRIPT_EVOLUTION)
    yosys_file.close()


    #opensta script
    opensta_file=open('./custom/opensta_script.tcl',mode='w',encoding='utf-8')
    opensta_file.write(OPENSTA_SCRIPT_EVOLUTION)
    opensta_file.close()

    #executing scripts
    #status=os.system('yosys -c {}yosys_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH))
    #os.system('yosys -c {}/yosys_script.tcl'.format(EVOLUTION_PATH))

    #status=os.system('sta {}opensta_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH))
    #os.system('sta {}/opensta_script.tcl'.format(EVOLUTION_PATH))

    yosysCmd='yosys -c ./custom/yosys_script.tcl'
    #yosysCmd='yosys -c yosys_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH,Z)
    result = subprocess.run(yosysCmd, shell=True)

    openstaCmd='sta ./custom/opensta_script.tcl'
    #openstaCmd='sta opensta_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH,Z)

    result = subprocess.run(openstaCmd,shell=True)

    if result.returncode != 0:
        print(f"{TAG} {result.stderr}")
    else:
        print(f'{TAG} Done generating report')




def updateTCLCommands(design,yosysCmd,openstaCmd):
        
        YOSYS_SCRIPT_EVOLUTION="""
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib {}

#read verilog design file
{}
read_verilog -overwrite ./custom/{}.v

hierarchy -check -top {}

#store the area result in a file
tee -q -o ./custom/result_{}.txt stat -liberty {}

#exit
exit


#---------------- yosys commands -------------------
""".format(LIBERTY_FILE,yosysCmd,design,design,design,LIBERTY_FILE)
        
        OPENSTA_SCRIPT_EVOLUTION="""
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty {}

#read the design file
{}
read_verilog ./custom/{}.v 


#identify the top module name
link_design {}

#clock frequency
create_clock -period  {} -name clk

#output load
set_load -pin_load 2.479712 [lsearch -inline -all -not -exact [all_outputs] clk]

set_driving_cell -lib_cell INVx1_ASAP7_75t_R [lsearch -inline -all -not -exact [all_inputs] clk]

#switching factor for truly random data
set_power_activity -input_ports [lsearch -inline -all -not -exact [all_inputs] clk] -activity 0.25


#input output delay constraint
set_input_delay 0 -clock clk [lsearch -inline -all -not -exact [all_inputs] clk]
set_output_delay 0 -clock clk [lsearch -inline -all -not -exact [all_outputs] clk]

#estimate power
report_power >> ./custom/result_{}.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ./custom/result_{}.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
""".format(LIBERTY_FILE,openstaCmd,design,design,str(CLOCK_PERIOD),design,design)
        
        return YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION

def reportMetrics():
    multiplierConfiguration=generate_final_config(nbits,np.array(CONFIGURATION))

    #solution decoding
    verilogCode,nrMultipliers, adderList=write_complete_verilog(multiplierConfiguration,nbits,design)
    yosysCmd = ''                                                                                                  
    #add path of modules here for non recursive multiplier
    for item in nrMultipliers:
        high = item[0]
        low = item[1]
        file_name = f"NR_{high}_{low}.v"
        yosysCmd += f"read_verilog -overwrite {MODULES_PATH}{file_name}\n"

    #add path of modules here for adder
    for item in adderList:
        bit_width = item[0]
        zero_bit = item[1]
        file_name = f"customAdder{bit_width}_{zero_bit}.v"
        yosysCmd += f"read_verilog -overwrite {MODULES_PATH}{file_name}\n"
    

    openstaCmd=''
    for item in nrMultipliers:
        high = item[0]
        low = item[1]
        file_name = f"NR_{high}_{low}.v"
        openstaCmd += f"read_verilog {MODULES_PATH}{file_name}\n"

    #add path of modules here for adder
    for item in adderList:
        bit_width = item[0]
        zero_bit = item[1]
        file_name = f"customAdder{bit_width}_{zero_bit}.v"
        openstaCmd += f"read_verilog {MODULES_PATH}{file_name}\n"
        
    

    YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION=updateTCLCommands(design,yosysCmd,openstaCmd)

    file=open('./custom/'+design+'.v',mode='w',encoding='utf-8')
    file.write(verilogCode)
    file.close()

    runTCLScripts(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION)


reportMetrics()