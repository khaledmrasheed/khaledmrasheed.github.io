import random
from deap import base, creator, tools, algorithms

IND_SIZE = 50 # bitstring length — goal is all 1s
 
creator.create("FitnessMax", base.Fitness, weights=(1.0,))
creator.create("Individual", list, fitness=creator.FitnessMax)

toolbox = base.Toolbox()
toolbox.register("attr_bool", random.randint, 0, 1)
toolbox.register("individual", tools.initRepeat, creator.Individual,
                  toolbox.attr_bool, n=IND_SIZE)
toolbox.register("population", tools.initRepeat, list, toolbox.individual)

def evaluate(individual):
    return (sum(individual),)  # fitness = count of 1s

toolbox.register("evaluate", evaluate)
toolbox.register("select", tools.selTournament, tournsize=3)
toolbox.register("mate", tools.cxTwoPoint)
toolbox.register("mutate", tools.mutFlipBit, indpb=0.05)


def main():
    pop = toolbox.population(n=100)
    stats = tools.Statistics(lambda ind: ind.fitness.values)
    stats.register("avg", lambda vals: sum(v[0] for v in vals) / len(vals))
    stats.register("max", max)
    algorithms.eaSimple(pop, toolbox, cxpb=0.5, mutpb=0.2,
                         ngen=50, stats=stats, verbose=True)

if __name__ == "__main__":
    main()