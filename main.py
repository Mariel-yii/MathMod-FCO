"""
 Run this file to execute the campus traffic flow
"""

import networkx as nx
import matplotlib.pyplot as plt


# Step 1: Graph of Data


edges = [
    ('G1','AC',58),
    ('AC','CICT',80),
    ('CICT','CoEd',92),
    ('CoEd','FH',71),
    ('G2','COE',35),
    ('COE','FH',70),
    ('G3','VH',73),
    ('VH','FH',21),
    ('G4','CSSP',169),
    ('CSSP','FH',18)
]

G = nx.Graph()

for u, v, w in edges:
    G.add_edge(u, v, weight=w)



# Step 2: Compute shortest path


def shortest_path(graph, source, target):
    path = nx.shortest_path(graph, source=source, target=target, weight='weight')
    length = nx.shortest_path_length(graph, source=source, target=target, weight='weight')
    return path, length



# Step 3: Shortest path for all source nodes(gates)

gates = ['G1','G2','G3','G4']
target = 'FH'

distances = []

print("\n=== SHORTEST PATH RESULTS ===")

for g in gates:
    path, dist = shortest_path(G, g, target)
    distances.append(dist)

    print(f"\n{g} -> {target}")
    print("Path:", " -> ".join(path))
    print("Distance:", dist, "m")



# Step 4: Compute the bottleneck 


def bottleneck_path(graph, path):
    weights = []
    for i in range(len(path)-1):
        w = graph[path[i]][path[i+1]]['weight']
        weights.append(w)
    return min(weights)

print("\n=== BOTTLENECK (CAPACITY LIMIT) ===")

bottlenecks = []

for g in gates:
    path = shortest_path(G, g, target)[0]
    b = bottleneck_path(G, path)
    bottlenecks.append(b)

    print(f"{g} bottleneck: {b} units")


# Step 5. CONGESTION MODEL


def congestion_cost(distance, bottleneck):
    return distance / bottleneck


costs = []

for i in range(len(gates)):
    c = congestion_cost(distances[i], bottlenecks[i])
    costs.append(c)



# Step 6. VISUALIZATION


plt.figure()
pos = nx.spring_layout(G, seed=42)
nx.draw(G, pos, with_labels=True)
labels = nx.get_edge_attributes(G, 'weight')
nx.draw_networkx_edge_labels(G, pos, edge_labels=labels)
plt.title("Campus Graph Model")
plt.show()


plt.figure()
plt.bar(gates, distances)
plt.ylabel("Distance (m)")
plt.title("Shortest Distance to FH")
plt.show()


plt.figure()
plt.bar(gates, costs)
plt.ylabel("Total Cost (w)")
plt.title("Shortest Path with Congestion Model")
plt.show()
