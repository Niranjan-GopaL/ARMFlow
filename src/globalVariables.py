'''
Author: Bhargav D V, Research Scholar, IIITB, under Prof.Madhav Rao
This script contains global Variables used across scripts.
'''

#------------import modules----------------#
from multiprocessing.pool import ThreadPool
import random
#------------import modules----------------#


#----------------------- user variables --------------------------#
N_BITS=32
DESIGN='multiplier{}bit'.format(str(N_BITS))
GENERATIONS=500

LIBERTY_FILE='../libFiles/ASAP_7nm_RVT_TT.lib'
SEED=2000
POPULATION=10




MUTATION_RATE=1.0
CROSSOVER_RATE=0.1
MUTATION_CHOICE=0

FLATTEN=''
CLOCK_PERIOD=10000
random.seed(SEED)
ALGORITHM='NSGA-II'

FOLDER='config1'
DPI=100


AREA=446.93
DELAY=910.01
POWER=6.11e-4
#ADDER='custom_Adder'
TAG='[ARMFLOW]'
SOLUTION_THREADS=10
MUTATION_VERBOSE=0
#----------------------- user variables --------------------------#


#----------------------- global variables --------------------------#
CURRENT_GEN=0
EVOLUTION_PATH='../evolution/{}/{}/{}/'.format(DESIGN,ALGORITHM,FOLDER)
CIRCUIT='../circuits/{}/{}/{}/'.format(DESIGN,ALGORITHM,FOLDER)
EXECUTION_TIME='../executionTime/{}/{}/{}/'.format(DESIGN,ALGORITHM,FOLDER)
FITNESS='../fitness/{}/{}/{}/fitness.npy'.format(DESIGN,ALGORITHM,FOLDER)
FITNESS_PLOT='../fitnessPlots/{}/{}/{}/'.format(DESIGN,ALGORITHM,FOLDER)
METRICS_PATH='../metrics/{}/{}/{}/'.format(DESIGN,ALGORITHM,FOLDER)
MODULES_PATH='../modules/netlist/'






#----------------------- global variables --------------------------#


#8-bit Multiplier
#area=26.6814 power=1.97e-05 delay=501.99ps

#16-bit multiplier
#area=110.66 delay=712.20 power=1.14e-04

#32-bit multiplier
#area=446.93 delay=910.01 power=6.11e-04