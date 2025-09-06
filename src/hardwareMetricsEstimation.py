#!/usr/bin/python3
"""
Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
This script is used to perform synthesis using Yosys and extract critical path delay and Power metrics for given approximate circuit.
"""


#--------- import --------------#
from globalVariables import *
import re
import os
import subprocess
#--------- import --------------#




#This function is used to generate and execute TCL scripts for Yosys and OpenSTA
def runTCLScripts(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z):
    #print('Generating and running TCL scripts of yosys and OpenSTA.....')
    #yosys script
    
    yosys_file=open('{}yosys_script_{}.tcl'.format(EVOLUTION_PATH,str(Z)),mode='w',encoding='utf-8')
    yosys_file.write(YOSYS_SCRIPT_EVOLUTION)
    yosys_file.close()


    #opensta script
    opensta_file=open('{}opensta_script_{}.tcl'.format(EVOLUTION_PATH,str(Z)),mode='w',encoding='utf-8')
    opensta_file.write(OPENSTA_SCRIPT_EVOLUTION)
    opensta_file.close()

    #executing scripts
    #status=os.system('yosys -c {}yosys_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH))
    #os.system('yosys -c {}/yosys_script.tcl'.format(EVOLUTION_PATH))

    #status=os.system('sta {}opensta_script.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH))
    #os.system('sta {}/opensta_script.tcl'.format(EVOLUTION_PATH))

    #yosysCmd='yosys -c {}yosys_script_{}.tcl'.format(EVOLUTION_PATH,Z)
    yosysCmd='yosys -c {}yosys_script_{}.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH,Z)
    result = subprocess.run(yosysCmd, shell=True)

    #openstaCmd='sta {}opensta_script_{}.tcl'.format(EVOLUTION_PATH,Z)
    openstaCmd='sta {}opensta_script_{}.tcl > /dev/null 2>&1'.format(EVOLUTION_PATH,Z)

    result = subprocess.run(openstaCmd,shell=True)

    if result.returncode != 0:
        print(f"{TAG} {result.stderr}")
    else:
        print(f'{TAG} Done generating report')

        
    

#This function is used to extract critical path delay and Power metrics.
def extractSynthesisMetrics(Z):
    #print('Extracting results.......')
    report_file=open('{}{}_result_{}.txt'.format(EVOLUTION_PATH,DESIGN,str(Z)),mode='r')
    report=report_file.read()

    report_file.close()
    # Extract chip area
    total_area_pattern = r"Chip area for top module '\\{}': ([\d.]+)".format(DESIGN+'_'+str(Z))
    

    # Extract total area
    total_area_match = re.search(total_area_pattern, report)
    Area = float(total_area_match.group(1)) if total_area_match else None

    


    # Regular expression to extract the total power for the combinational circuit
    pattern = r"Combinational\s+[\d.e+-]+\s+[\d.e+-]+\s+[\d.e+-]+\s+([\d.e+-]+)"
    match = re.search(pattern, report)

    if match:
        Power = float(match.group(1))
    

    # Extract data arrival time
    arrival_time_match = re.search(r"\s+(\d+\.\d+)\s+data arrival time", report)
    Delay = float(arrival_time_match.group(1)) if arrival_time_match else 0




    #os.system('clear')
    print('------{}-------'.format(DESIGN))
    '''if(FLATTEN==''):
        print('Flattened netlist..')
    else:
        print('Not flattened netlist.....')'''
    #print(slack)
    #print(1/(100-slack))
    print('{}Area={} um^2, Power={} W, Delay={} ps'.format(TAG,str(Area),str(Power),str(Delay)))

    return Area,Delay,Power


#This function is used to extract critical path delay and Power metrics.
def extractSynthesisMetricsFinal(Z):
    #print('Extracting results.......')
    report_file=open('{}{}_result_{}.txt'.format(EVOLUTION_PATH,DESIGN,str(Z)),mode='r')
    report=report_file.read()

    report_file.close()
    # Extract chip area
    total_area_pattern = r"Chip area for top module '\\{}': ([\d.]+)".format(DESIGN+'_'+str(Z))
    

    # Extract total area
    total_area_match = re.search(total_area_pattern, report)
    Area = float(total_area_match.group(1)) if total_area_match else None

    


    # Regular expression pattern to extract combinational power values
    pattern = re.compile(r"Combinational\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)\s+([\d.e+-]+)")

    match = pattern.search(report)

    if match:
        internalPower = match.group(1)
        switchingPower = match.group(2)
        leakagePower = match.group(3)
        totalPower = match.group(4)
    

    # Extract data arrival time
    arrival_time_match = re.search(r"\s+(\d+\.\d+)\s+data arrival time", report)
    Delay = float(arrival_time_match.group(1)) if arrival_time_match else 0




    #os.system('clear')
    print('------{}-------'.format(DESIGN))
    '''if(FLATTEN==''):
        print('Flattened netlist..')
    else:
        print('Not flattened netlist.....')'''
    #print(slack)
    #print(1/(100-slack))
    print('{}Area={} um^2, Power={} W, Delay={} ps'.format(TAG,str(Area),str(totalPower),str(Delay)))

    return Area,Delay,internalPower,switchingPower,leakagePower,totalPower

#Top level script to run synthesis flow using Yosys and OpenSTA
def runSynthesis(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z):
    print(f'{TAG} Running synthesis...')
    #generate_Sequential_Module(netlist)

    runTCLScripts(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z)

    Area,Delay,Power=extractSynthesisMetrics(Z)

    return Area,Delay,Power

#Top level script to run synthesis flow using Yosys and OpenSTA
def runSynthesisFinal(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z):
    print(f'{TAG} Running synthesis...')
    #generate_Sequential_Module(netlist)

    runTCLScripts(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z)

    Area,Delay,internalPower,switchingPower,leakagePower,totalPower=extractSynthesisMetricsFinal(Z)

    return Area,Delay,internalPower,switchingPower,leakagePower,totalPower