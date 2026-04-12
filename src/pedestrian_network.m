% Edges
s = {'G1','AC','CICT','CoEd','G2','COE','G3','VH','G4','CSSP'};
t = {'AC','CICT','CoEd','FH','COE','FH','VH','FH','CSSP','FH'};
weights = [58 80 92 71 35 70 73 21 169 18];
G = graph(s,t,weights);
plot(G,'EdgeLabel',G.Edges.Weight)
