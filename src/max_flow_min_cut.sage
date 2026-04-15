G_flow = DiGraph(weighted=True)
G_flow.add_edges([
    ("G1", "AC", 55), ("AC", "CICT", 40), ("CICT", "CoEd", 30),
    ("CoEd", "FH", 35), ("G2", "COE", 65), ("COE", "FH", 40),
    ("G3", "VH", 25), ("VH", "FH", 20), ("G4", "CSSP", 15),
    ("CSSP", "FH", 27)
])

#  Calculate Maximum Flow
max_flow_val = G_flow.flow("G1", "FH", use_edge_labels=True)
print(f"Maximum Flow from G1 to FH: {max_flow_val} students/min")

# Calculate Minimum Cut
min_cut_val, partition = G_flow.edge_cut("G1", "FH", use_edge_labels=True, value_only=False)

print(f"Min-Cut Value: {min_cut_val}")
print(f"The cut separates the graph into these two sets: {partition}")
G.show()
