from itertools import count
import random
from random import choice
from re import A
import numpy as np
from pymoo.core.mutation import Mutation
# from pprint import pprint
import config_validator as cv
import generate_final_config as gfc



class CustomMutation(Mutation):
    
    def __init__(self, nbits, MUTATION_RATE):
        super().__init__()
        self.nbits = nbits
        self.MUTATION_RATE = MUTATION_RATE
        self.count_dict = {}
        self.index_repeating_flag = {}
        self.vistied_indices = []
        self.repeating_index_mutation = 0
        
    def make_immutable(self, obj):
        if isinstance(obj, list):
            return tuple(self.make_immutable(sub) for sub in obj)
        else:
            return obj

    def update_non_recursive(self, index, current_config, MUTATION_RATE, nbits):
        
        self.vistied_indices.append(nbits - index)
        #print(f"Going into function with index={index}")
        
        # Edge Case 4: So suppose a config is initially non repeating. But later becomes repeating.
        # So we use the index_repeatingflag_dictionary. If its true, that means that multiplier is a repeating one.
        # Handled later in repeating part

        if self.count_dict[nbits - index] > 1 and (nbits - index) > 2:
            current_config[index] = 0
            # count_dict[nbits - index] += 1
            #print(f"Returned because {nbits - index} was repeating")
            return
        self.index_repeating_flag[nbits - index] = True
        
        curr_nbits = nbits - index
        #print(f"curr_nbits={curr_nbits}")
        # Edge Case 1: When index represents 2 or 1. In that case we don't modicy that position. It is always -1
        if (index >= nbits - 2):
            # #print(f"Returned because {index} was for either multiplier 1 or 2.")
            return
        
        prob = random.random()
        #print(f"Probability={prob}")
        if prob <= MUTATION_RATE:
            
            k = nbits - index
            choices = [-1] + list(range(1, k)) if index != 0 else list(range(1, k)) # This is one more edge case that index=0 cannot have config=-1
            new_config = random.choice(choices)
            #print(f"The new config for this is {new_config}")
            if (new_config != -1) and (new_config != curr_nbits - new_config):
                current_config[index] = new_config
                self.count_dict[new_config] += 1
                self.count_dict[curr_nbits - new_config] += 1
                #print(f"Count dict incremented for {new_config} & {curr_nbits - new_config}")
                
                #print(f"New_config={new_config}")
                # index_repeating_flag[new_config] = True
                # index_repeating_flag[nbits - new_config] = True
                
                # Edge Case 3: Suppose I break my multiplier into H and L. I will go to max(H, L) first, then to min(H, L)
                # So suppose a config is initially non repeating. But later becomes repeating.
                # Then we need to make the previous one 0. To make sure this doesn't happen, I do this
                if new_config > curr_nbits - new_config:
                    new_index = nbits - new_config
                    #print(f"New Index ={new_index}, New Config ={new_config}")
                    self.update_non_recursive(new_index, current_config, MUTATION_RATE, nbits)
                    
                    new_config_l = curr_nbits - new_config
                    new_index_l = nbits - new_config_l
                    #print(f"New Index_l ={new_index_l}, New Config_l = {new_config_l}")
                    self.update_non_recursive(new_index_l, current_config, MUTATION_RATE, nbits)
                else: 
                    new_config_l = curr_nbits - new_config
                    new_index_l = nbits - new_config_l
                    #print(f"Else New Index_l ={new_index_l}, Else New Config_l = {new_config_l}")
                    self.update_non_recursive(new_index_l, current_config, MUTATION_RATE, nbits)

                    new_index = nbits - new_config
                    #print(f"Else New Index ={new_index}, Else New Config ={new_config}")
                    self.update_non_recursive(new_index, current_config, MUTATION_RATE, nbits)

                    
            # Edge case 2: When the new_config is like repeating same multpliers. It needs to be handled in the repeating section.
            elif (new_config == curr_nbits - new_config):
                self.vistied_indices.append(new_config)
                new_index = nbits - new_config
                current_config[new_index] = 0
                current_config[index] = new_config
                self.count_dict[new_config] += 4
                self.index_repeating_flag[new_config] = True
                #print(f"Returned because the new config {new_config} was in the repeating part")
                return
            
            else:
                #print(f"In Else part")
                current_config[index] = new_config
                return
                # update_non_recursive(index + 1, current_config, MUTATION_RATE, nbits)
        else:
            # If suppose 8 --> 5 and I don't modify 5. So the next place I should move is to index(5)
            # index(5) = 8 - 5 = 3
            next_config = current_config[index]
            next_config_l = curr_nbits - next_config
            next_index = nbits - next_config
            next_index_l = nbits - next_config_l
            
            # print(f"Non-Repeating...")
            # print(f"next config = {next_config}, next config_l = {next_config_l}")
            if next_config < 2:
                return
            if next_config > next_config_l:
                self.count_dict[next_config] += 1
                self.count_dict[next_config_l] += 1
                self.update_non_recursive(next_index, current_config, MUTATION_RATE, nbits)
                self.update_non_recursive(next_index_l, current_config, MUTATION_RATE, nbits)
                
            elif next_config < next_config_l:
                self.count_dict[next_config] += 1
                self.count_dict[next_config_l] += 1
                self.update_non_recursive(next_index_l, current_config, MUTATION_RATE, nbits)
                self.update_non_recursive(next_index, current_config, MUTATION_RATE, nbits)
            else:
                self.vistied_indices.append(next_config)
                # print(f"Next Config = {next_config}")
                self.count_dict[next_config] += 4
                return
                
                
                
        
    def update_non_recursive_unvisited(self, new_config, nbits):
        # At the end I need to make all non-visited nodes as -1
        
        for i in range(0, nbits):
            if (nbits - i) not in self.vistied_indices:
                new_config[i] = -1
                
        return new_config

    def update_recursive(self, curr_bits, repeating_config, MUTATION_RATE):
        
        #print("Inside update_recursive....")
        
        #print(f"Curr_Bits = {curr_bits}")
        # Base Case: If curr_bits = 1 or 2, return
        if curr_bits == 1 or curr_bits == 2:
            return
        
        # Check if repeating index is valid or not
        if repeating_index_mutation >= len(repeating_config):
            return
        #print(f"Current Repeating Index Value = {repeating_index_mutation}")
        choices = [-1] + list(range(1, curr_bits))
        #print(f"Validity Checking...")
        #print(f"repeating_config[repeating_index_mutation] = {repeating_config[repeating_index_mutation]}")
        #print(f"Limit = {curr_bits - 1}")
        
        
        if (repeating_config[repeating_index_mutation] > curr_bits - 1):
            #print("Limit Invalid... Need to change")
            # Case when irrespective of mutation rate, we need to modify the config
            new_config = random.choice(choices)  
            #print(f"New Config = {new_config}") 
            #print(f"New Config L = {curr_bits - new_config}")     
            repeating_config[repeating_index_mutation] = new_config
            repeating_index_mutation += 1
            
            # Case 1. If new config is -1, return
            if new_config == -1:
                return
            
            # The function which converts this into list handles lower bits first then higher bits in the repeating part
            # Hence this fashion of if-else
            if new_config < curr_bits - new_config:
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                self.update_recursive(curr_bits - new_config, repeating_config, MUTATION_RATE)
            elif new_config > curr_bits - new_config:
                self.update_recursive(curr_bits - new_config, repeating_config, MUTATION_RATE)
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
            else:
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                
        else:
            #print("Limit Valid... Check with Mutation Rates")
            prob = random.random()
            
            if prob <= MUTATION_RATE:
                new_config = random.choice(choices)        
                repeating_config[repeating_index_mutation] = new_config
                repeating_index_mutation += 1
                
                #print(f"New Config = {new_config}") 
                #print(f"New Config L = {curr_bits - new_config}")     
            
                # Case 1. If new config is -1, return
                if new_config == -1:
                    return
                
                if new_config < curr_bits - new_config:
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                    self.update_recursive(curr_bits - new_config, repeating_config, MUTATION_RATE)
                elif new_config > curr_bits - new_config:
                    self.update_recursive(curr_bits - new_config, repeating_config, MUTATION_RATE)
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                else:
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
                    self.update_recursive(new_config, repeating_config, MUTATION_RATE)
            # Add the else part. Basically when prob <= MUTATION RATE
            else:
                # print("In FINAL ELSE")
                next_config = -1
                while repeating_index_mutation < len(repeating_config):
                    next_config = repeating_config[repeating_index_mutation]
                    repeating_index_mutation += 1
                    if next_config == -1:
                        break
                # print(f"Repeating Index Becomes = {repeating_index_mutation}")
                # print(f"Next_config={next_config}")
                
                if next_config > 2:
                    # print("Going to update recursive")
                    self.update_recursive(next_config, repeating_config, MUTATION_RATE)
                else:
                    # print("Not Going")
                    return
                
                    
            


    def recursive_top(self, repeating_primary_value, repeating_count, repeating_config, MUTATION_RATE):
        
        repeating_index_mutation = 0
        
        #print(f"Starting Recursive Update")
        #print(f"Repeating Count = {repeating_count}")
        #print(f"Repeating Primary Value = {repeating_primary_value}")
        for _ in range(repeating_count):
            self.update_recursive(repeating_primary_value, repeating_config, MUTATION_RATE)
        for i in range(repeating_index_mutation + 1, len(repeating_config)):
            repeating_config[i] = -1
        
    def customMutationTop(self, config_array, nbits, MUTATION_RATE=0.5):
        
        while(1):
            for i in range(1, nbits+1):
                self.index_repeating_flag[i] = False
                self.count_dict[i] = 0
            
            nonrepeating_config = config_array[0:nbits]
            repeating_config = config_array[nbits:] + []
            
            self.update_non_recursive(0, current_config=nonrepeating_config, MUTATION_RATE=MUTATION_RATE, nbits=nbits)
            nonrepeating_config = self.update_non_recursive_unvisited(nonrepeating_config, nbits=nbits)
            
            print("Non Repeating completed")
            
            repeating_primary_value = -1
            repeating_count = 0
            for i in self.count_dict:
                if self.count_dict[i] > 1:
                    repeating_primary_value = i
                    repeating_count = self.count_dict[i]
            if repeating_primary_value != -1:
                self.recursive_top(repeating_primary_value=repeating_primary_value, repeating_count=repeating_count, repeating_config=repeating_config, MUTATION_RATE=MUTATION_RATE)
            
            final_config = nonrepeating_config + repeating_config

            if(cv.config_validator(final_config)==True):
                break
        
        return final_config


            
    def _do(self, problem, X, params=None, **kwargs):
        X = X.astype(float)

        Xp = []
        for item in X:
            item = item.tolist()
            new_config = self.customMutationTop(config_array= item, nbits=self.nbits, MUTATION_RATE=self.MUTATION_RATE)
            
            Xp.append(np.array(new_config))
        return Xp


# def main():
    
#     global index_repeating_flag
#     global count_dict
    
#     nbits = 16
#     Mutation_Rate = 0.5
    
#     mutation_object = CustomMutation(nbits=nbits, MUTATION_RATE=Mutation_Rate) 
    
#     solution1 = np.array([4, -1, -1, -1, 2, -1, 7, -1, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution2 = np.array([10, -1, -1, -1, -1, -1, -1, -1, -1, -1, 4, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution3 = np.array([12, -1, -1, -1, 4, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, 2, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution4 = np.array([11, -1, -1, -1, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution5 = np.array([12, -1, -1, -1, 7, -1, -1, -1, -1, 2, -1, 0, 2, -1, -1, -1, 2, 1, 2, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution6 = np.array([10, -1, -1, -1, -1, -1, 3, -1, -1, 3, 4, -1, 0, 0, -1, -1, 1, 1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution7 = np.array([12, -1, -1, -1, 10, -1, 4, -1, -1, -1, 1, 3, 0, -1, -1, -1, -1, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution8 = np.array([3, -1, -1, 4, -1, -1, -1, 6, -1, -1, 4, -1, 0, 0, -1, -1, 1, -1, 2, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
#     solution9 = np.array([10, -1, -1, -1, -1, -1, 7, -1, -1, 2, 2, -1, 1, 0, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1])
    
#     sampling = np.vstack([
#         solution1,
#         solution2,
#         solution3,
#         solution4,
#         solution5,
#         solution6,
#         solution7,
#         solution8,
#         solution9
#     ])
    
#     problem = []
#     new_solutions = mutation_object._do(problem=problem, X=sampling,)
    
#     # for i in range(1, nbits+1):
#     #     index_repeating_flag[i] = False
#     #     count_dict[i] = 0
#     # config_array = [ 6, -1,  3, -1, -1,  0, -1, -1,  1, -1, -1,  1, -1, -1, -1, -1]
#     # config_array = [5, -1, -1, -1, -1, 6, -1, -1, -1, -1, 4, 0, 3, 2, -1, -1, 2, -1, -1, -1, -1, -1]
#     # temp_array = [-1]*(52 - len(config_array))
#     # config_array = config_array + temp_array
    
#     # incorrect_configs = set()
#     # correct_configs = set()
#     # count = 0
    
#     # for i in range(2000):
#     #     final_array = customMutation(config_array=config_array, nbits=nbits, MUTATION_RATE=0.5)
#     #     # print(final_array)
#     #     if cv.config_validator(n_bits=nbits, config_array=np.array(final_array)) == False:
#     #         count+=1
#     #         incorrect_configs.add(tuple(final_array))
#     #     else:
#     #         final_multiplier = gfc.generate_final_config(n_bits=nbits, array=np.array(final_array))
#     #         correct_configs.add(make_immutable(final_multiplier))
            
#     # print(count)
#     # print(incorrect_configs)
#     # print(len(correct_configs))
#     # print(incorrect_configs)
#     # nonrepeating_config = config_array[0:nbits]
#     # repeating_config = config_array[nbits:] + []
#     # update_non_recursive(0, current_config=nonrepeating_config, MUTATION_RATE=0, nbits=nbits)
#     # # #print(f"Visited Nodes{vistied_indices}")
#     # #print()
#     # #print(count_dict)
#     # nonrepeating_config = update_non_recursive_unvisited(nonrepeating_config, nbits=nbits)
    
    
#     # repeating_primary_value = -1
#     # repeating_count = 0
#     # for i in count_dict:
#     #     if count_dict[i] > 1:
#     #         repeating_primary_value = i
#     #         repeating_count = count_dict[i]
#     # if repeating_primary_value != -1:
#     #     recursive_top(repeating_primary_value=repeating_primary_value, repeating_count=repeating_count, repeating_config=repeating_config, MUTATION_RATE=0)
    
#     # final_config = nonrepeating_config + repeating_config
#     # #print(final_config)
    
# if __name__ == "__main__":
#     main()

    