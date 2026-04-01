capacity = [55 40 30 35 65 40 25 20 15 27];
weights_cong = weights ./ capacity;
G2 = graph(s,t,weights_cong);
G2.Edges.Weight = round(weights_cong(:), 2);
plot(G2, 'EdgeLabel', G2.Edges.Weight, 'Layout', 'force')
