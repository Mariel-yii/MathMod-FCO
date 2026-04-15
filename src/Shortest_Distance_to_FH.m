# BulSu Network with distance
G = Graph()

# Add weighted edges (u, v, weight)
edges = [
    ('G1', 'AC', 58),
    ('AC', 'CICT', 80),
    ('CICT', 'CoEd', 92),
    ('CoEd', 'FH', 71),
    
    ('G2', 'COE', 35),
    ('COE', 'FH', 70),
    
    ('G3', 'VH', 73),
    ('VH', 'FH', 21),
    
    ('G4', 'CSSP', 169),
    ('CSSP', 'FH', 18)
]

G.add_edges(edges)

# Sources and destination
sources = ['G1', 'G2', 'G3', 'G4']
target = 'FH'

print("{:<6} | {:<40} | {:<8}".format("Source","Shortest Path","Distance"))
print("-"*70)

# Compute shortest paths
for s in sources:
    path = G.shortest_path(s, target, by_weight=True)
    dist = G.distance(s, target, by_weight=True)
    print("{:<6} | {:<40} | {:<8}".format(s, str(path), dist))
G.show()
