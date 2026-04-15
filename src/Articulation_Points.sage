from sage.all import Graph as SageGraph

bulsu_edges = [
    ('G1', 'AC', 58), ('AC', 'CICT', 80), ('CICT', 'CoEd', 92), 
    ('CoEd', 'FH', 71), ('FH', 'VH', 21), ('VH', 'G3', 73),
    ('FH', 'COE', 70), ('COE', 'G2', 35), ('FH', 'CSSP', 18), 
    ('CSSP', 'G4', 169)
]

G = SageGraph(bulsu_edges)
art_points = G.blocks_and_cut_vertices()[1]

G.show(
    vertex_colors={
        'red': art_points, 
        'lightblue': [v for v in G.vertices() if v not in art_points]
    },
    layout='spring',
    figsize=5,
    vertex_size=500
)

print("Articulation Points:", art_points)
