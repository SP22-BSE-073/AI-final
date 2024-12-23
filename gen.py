# import random

# mutation_rate=0.9

# def gen_pop(pop_size,numberOfQueens):
#     return [random.sample(range(numberOfQueens),numberOfQueens) for _ in range(pop_size)]

# def fitness(child):
#     n = len(child)
#     conflicts = 0
#     for i in range(n):
#         for j in range(i+1,n):
#             if child[i] == child[j] or abs(child[i]-child[j])== j-i:
#                 conflicts+1
#     return conflicts

# def selection(population,fitness_scores):
#     combined = list(zip(population,fitness_scores))
#     combined.sort(key=lambda x: x[1])
#     return combined[0][0],combined[1][0]

# def crossOver(parent1,parent2):
#     point = random.randint(len(parent1))
#     child1= parent1[:point]+parent2[point:]
#     child2= parent2[:point]+parent1[point:]
#     return child1,child2

# def mutation(child):
#     if mutation_rate <= random.random():
#         point = random.randint(0,len(child)-1)
#         child[point] = random.randint(0,len(child)-1)
#         return child
#     return child

# def algo(generation,pop_size,numberOfQueens):
#     population = gen_pop(pop_size,numberOfQueens)
#     min_conflict=0

#     for gen in range(generation):
#         fitness_scores = [fitness(board) for board in population]
#         if min_conflict in fitness_scores :
#             return population[fitness_scores.index(min_conflict)]
        
#         new_population = []
#         for _ in range(pop_size // 2):
#             parent1,parent2 = selection(population,fitness_scores)
#             child1,child2 = crossOver(parent1,parent2)
#             mutation(child1)
#             mutation(child2)
#             new_population.append(child1)
#             new_population.append(child2)

#         population = new_population
#     return None

# solution= algo(generation=1000,pop_size=100,numberOfQueens=8)
# if solution:
#     print(solution)


map = {
    "Western Australia": ["Northern Territory", "South Australia"],
    "Northern Territory": ["Western Australia", "South Australia", "Queensland"],
    "South Australia": ["Western Australia", "Northern Territory", "Queensland", "New South Wales", "Victoria"],
    "Queensland": ["Northern Territory", "South Australia", "New South Wales"],
    "New South Wales": ["Queensland", "South Australia", "Victoria"],
    "Victoria": ["South Australia", "New South Wales", "Tasmania"],
    "Tasmania": ["Victoria"],
}
colors = ["Red", "Green", "Blue"]

def map_coloring(graph,colors,assignment={}):
    if len(assignment) == len(graph):
        return assignment
    
    unassigned_city= next(city for city in graph if city not in assignment)

    for color in colors:
        if all(assignment.get(neighbour)!=color for neighbour in graph[unassigned_city]):
            assignment[unassigned_city]=color
            result = map_coloring(graph,colors,assignment)
            if result:
                return result
            del assignment[unassigned_city]
    return None

solution = map_coloring(map, colors)
print(solution)