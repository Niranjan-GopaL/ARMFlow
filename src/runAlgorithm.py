#!/usr/bin/python3
"""
Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
This script is used to generate optimized pareto optimal reconfigurable approximate circuits
"""


#------------import modules----------------#
from globalVariables import *
from datetime import datetime
from objectiveEvaluation import asymmetricMultiplier
from optimizationUtils import MyCallback,generateRandomSolution
from pymoo.util.ref_dirs import get_reference_directions
from operators import CustomMutation,uniformCrossover
from pymoo.algorithms.moo.nsga3 import NSGA3
from pymoo.algorithms.moo.nsga2 import NSGA2
from pymoo.algorithms.soo.nonconvex.brkga import BRKGA
from pymoo.algorithms.soo.nonconvex.pso import PSO
from pymoo.algorithms.soo.nonconvex.ga import GA
from pymoo.operators.crossover.pntx import PointCrossover
from pymoo.operators.mutation.bitflip import BitflipMutation
from pymoo.operators.sampling.rnd import IntegerRandomSampling
from pymoo.termination import get_termination
from pymoo.optimize import minimize
import numpy as np
import os
from generate_verilog import write_complete_verilog
from config_validator import config_validator
from generate_final_config import generate_final_config
#------------import modules----------------#



def runFramework():
    #create folders
    os.system('./createFolders.sh {} {} {}'.format(DESIGN,ALGORITHM,FOLDER))
    #write start time in a file
    file=open(EXECUTION_TIME+'duration.txt',mode='w',encoding='utf-8')
    # get the current date and time
    # Get current date and time
    current_datetime = datetime.now()

    # Extract date, time, and day
    current_date = current_datetime.date()
    current_time = current_datetime.time()
    current_day = current_datetime.strftime("%A")

    file.write("Started Current Date:"+ str(current_date)+" Current Time:"+ str(current_time)+" Current Day:"+ str(current_day)+'\n')
    file.close()

    #change here
    #solution1=[0]*len(module.MODULES)
    #sampling=np.array([solution1]*(POPULATION-1))

    #limits
    sampling=np.vstack(generateRandomSolution())
    #sampling=np.vstack((np.array([solution1]),np.random.randint(low=0,high=3,size=(POPULATION-1,len(module.MODULES)))))
    #sampling=np.vstack((np.array([solution1]),np.array(otherSolutions)))
    
    problem=asymmetricMultiplier()
    callback = MyCallback()

    if(ALGORITHM=='NSGA-II'):
        #ref_dirs = get_reference_directions("uniform", 4, n_partitions=3)
        algorithm = NSGA2(pop_size=POPULATION,sampling=sampling,crossover=uniformCrossover(n_points=1,prob=0.0),
            mutation=CustomMutation(N_BITS))
    if(ALGORITHM=='GA'):
        algorithm = GA(pop_size=POPULATION,sampling=sampling,crossover=uniformCrossover(n_points=1,prob=0.0),
            mutation=CustomMutation(N_BITS))
    #algorithm = PSO(pop_size=POPULATION,sampling=IntegerRandomSampling())
    termination = get_termination("n_gen", GENERATIONS)
    res = minimize(problem,
                    algorithm,
                    termination,
                    save_history=False,
                    callback=callback,
                    seed=SEED,
                    verbose=True)
    
    print(f'{TAG} Solutions')
    print(TAG,res.F)
    print(TAG,res.X)

    
    

    


    file=open(EXECUTION_TIME+'duration.txt',mode='a',encoding='utf-8')
    # Get current date and time
    current_datetime = datetime.now()

    # Extract date, time, and day
    current_date = current_datetime.date()
    current_time = current_datetime.time()
    current_day = current_datetime.strftime("%A")

    file.write("Terminated Current Date:"+ str(current_date)+" Current Time:"+ str(current_time)+" Current Day:"+ str(current_day)+'\n')
    file.close()


    # store the decoded solutions in respective folders
    if(ALGORITHM=='NSGA-II'):
        x=res.X
    if(ALGORITHM=='GA'):
        x=[res.X]
    #if(x!=None):
    for i in range(len(x)):
        multiplierConfiguration=generate_final_config(N_BITS,x[i])

        #solution decoding
        verilogCode,nrMultipliers, adderList=write_complete_verilog(multiplierConfiguration,N_BITS,DESIGN+'_'+str(i))


        verilogFile=open(CIRCUIT+DESIGN+f'_{i}.v',mode='w',encoding='utf-8')
        verilogFile.write(verilogCode)
        verilogFile.close()

    
    # Convert data to numpy array for easier manipulation
    data = callback.data
    print(len(data))
    #save fitness evluations in numpy array
    np.savez('{}npz'.format(FITNESS[:-3]),*data)

    np.save('{}'.format(FITNESS),np.array(data))

runFramework()