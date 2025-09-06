"""
Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
This script is used to generate optimized pareto optimal reconfigurable approximate circuits
"""


#------------import modules----------------#
from globalVariables import *
from objectiveEvaluation import customProblem
from optimizationUtils import MyCallback,CustomMutation_NSGA_II
from pymoo.operators.crossover.pntx import PointCrossover
from pymoo.operators.sampling.rnd import IntegerRandomSampling
from pymoo.termination import get_termination
from pymoo.optimize import minimize
import numpy as np
#------------import modules----------------#

#------------import algorithms-------------#
from pymoo.algorithms.moo.nsga2 import NSGA2
from pymoo.algorithms.moo.spea2 import SPEA2
from pymoo.algorithms.moo.age2 import AGEMOEA2
from pymoo.algorithms.moo.moead import MOEAD
from pymoo.algorithms.soo.nonconvex.pso import PSO
from pymoo.algorithms.soo.nonconvex.ga import GA
from pymoo.algorithms.soo.nonconvex.es import ES
from pymoo.algorithms.soo.nonconvex.de import DE
#------------import algorithms-------------#


def runFramework():

    #sampling=np.vstack((np.array([solution1]),np.random.randint(low=0,high=0,size=(POPULATION-1,numberOfWires))))
    problem=customProblem()
    callback = MyCallback()
    algorithm = NSGA2(pop_size=POPULATION,sampling=IntegerRandomSampling(),crossover=PointCrossover(n_points=1,prob=0.0),
        mutation=CustomMutation_NSGA_II())
    termination = get_termination("n_gen", GENERATIONS)
    res = minimize(problem,
                    algorithm,
                    termination,
                    save_history=False,
                    callback=callback,
                    seed=SEED,
                    verbose=True)
    pool.close()
    print('Solutions')
    print(res.F)
    objectives=np.array(list(res.F))
    solution=np.array(list(res.X.astype(int)))
    print(res.X)


if(__name__=='__main__'):
    runFramework()