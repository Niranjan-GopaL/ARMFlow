"""
Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
This script implements genetic algorithm either single or multi-objective for optimizing multiplier architecture.
"""

#------------import modules----------------#
from optimizationUtils import determineDecisionVariableLimit
from pymoo.core.problem import Problem
from globalVariables import *
import numpy as np
import re
import os
import importlib
from hardwareMetricsEstimation import runSynthesis
import math
from generate_verilog import write_complete_verilog
from config_validator import config_validator
from generate_final_config import generate_final_config
from concurrent.futures import ThreadPoolExecutor, as_completed
#------------import modules----------------#



#this is custom problem formulation class for Genetic Algorithm
class asymmetricMultiplier(Problem):

    def __init__(self,**kwargs):
        
        self.xl,self.xu=determineDecisionVariableLimit()

        variables=len(self.xl)
        if(ALGORITHM=='NSGA-II'):
            super().__init__(n_var=variables, n_obj=3, n_ieq_constr=1,n_constr=0,elementwise_evaluation=False, xl=self.xl, xu=self.xu,vtype=int,**kwargs)
        if(ALGORITHM=='GA'):
            super().__init__(n_var=variables, n_obj=1, n_ieq_constr=1,n_constr=0,elementwise_evaluation=False, xl=self.xl, xu=self.xu,vtype=int,**kwargs)

    #NSGA2 problem in-built function to evaluate solution.
    def _evaluate(self, X, out, *args, **kwargs):
        global CURRENT_GEN

        # Write current generation to file
        with open(f'{EVOLUTION_PATH}generation.txt', 'w') as genFile:
            genFile.write(str(CURRENT_GEN))
        CURRENT_GEN += 1
        #input('press')
        F = [None] * len(X)
        G = [None] * len(X)

        # Parallel evaluation using ThreadPoolExecutor
        with ThreadPoolExecutor(max_workers=SOLUTION_THREADS) as executor:
            futures = {executor.submit(self.evaluateProblem, X[k], k): k for k in range(len(X))}

            for future in as_completed(futures):
                k = futures[future]
                try:
                    f_val, g_val = future.result()
                    F[k] = f_val
                    G[k] = g_val
                except Exception as e:
                    print(f"[ERROR] Evaluating solution {k}: {e}")
                    if(ALGORITHM=='NSGA-II'):
                        F[k] = [1e9,1e9,1e9]  # Assign high penalty if needed
                    else:
                        F[k] = [1e9]
                    
                    G[k] = [1e9]

        out["F"] = np.array(F)
        out["G"] = np.array(G)

    def updateTCLCommands(self,yosysCmd,openstaCmd,Z):
        
        YOSYS_SCRIPT_EVOLUTION="""
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib {}

#read verilog design file
{}
read_verilog -overwrite {}{}_{}.v

hierarchy -check -top {}_{}

#store the area result in a file
tee -q -o {}{}_result_{}.txt stat -liberty {}

#exit
exit


#---------------- yosys commands -------------------
""".format(LIBERTY_FILE,yosysCmd,EVOLUTION_PATH,DESIGN,str(Z),DESIGN,str(Z),EVOLUTION_PATH,DESIGN,str(Z),LIBERTY_FILE)
        
        OPENSTA_SCRIPT_EVOLUTION="""
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty {}

#read the design file
{}
read_verilog {}{}_{}.v 


#identify the top module name
link_design {}_{}

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
report_power >> {}{}_result_{}.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> {}{}_result_{}.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
""".format(LIBERTY_FILE,openstaCmd,EVOLUTION_PATH,DESIGN,str(Z),DESIGN,str(Z),str(CLOCK_PERIOD),EVOLUTION_PATH,DESIGN,str(Z),EVOLUTION_PATH,DESIGN,str(Z))
        
        return YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION

    #this function is used to evaluate each solution independently and should return objectives and constraints
    def evaluateProblem(self,x,Z):
        
        
        print('================{} {}===================='.format(str(Z),x))
        #input('press')
    
        
        
        multiplierConfiguration=generate_final_config(N_BITS,x)

        #solution decoding
        verilogCode,nrMultipliers, adderList=write_complete_verilog(multiplierConfiguration,N_BITS,DESIGN+'_'+str(Z))
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
            
        

        YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION=self.updateTCLCommands(yosysCmd,openstaCmd,Z)


        #format read_verilog {}
        # read_verilog ../modules/rtl/{}.v
        #create verilog file
        verilogFile=open(EVOLUTION_PATH+DESIGN+f'_{Z}.v',mode='w',encoding='utf-8')
        verilogFile.write(verilogCode)
        verilogFile.close()

        Area,Delay,Power=runSynthesis(YOSYS_SCRIPT_EVOLUTION,OPENSTA_SCRIPT_EVOLUTION,Z)

        #default violation is 0
        hardwareViolation=0

        '''if(Area>AREA):
            hardwareViolation+=abs(Area-AREA)
            print(f'{TAG} Area violation')
        if(Delay>DELAY):
            hardwareViolation+=abs(Delay-DELAY)
            print(f'{TAG} Delay violation')
        if(Power>POWER):
            hardwareViolation+=abs(Power-POWER)
            print(f'{TAG} Power violation')'''

        if(ALGORITHM=='GA'):
            
            #return [[math.sqrt(((Area/AREA)**2)+((Delay/DELAY)**2)+((Power/POWER)**2))],[hardwareViolation]]
            return [[Delay],[hardwareViolation]]
            
        if(ALGORITHM=='NSGA-II'):
            
            return [[Area/AREA,Delay/DELAY,Power/POWER],[hardwareViolation]]
            
