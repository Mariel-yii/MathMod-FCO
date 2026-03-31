>> % EDGES
s = {'G1', 'AC', 'CICT', 'CoEd', 'G2', 'COE', 'G3', 'VH', 'VH', 'G4', 'CSSP'};
t = {'AC', 'CICT', 'CoEd', 'FH',   'COE', 'FH',  'VH', 'FH', 'FE', 'CSSP', 'FH'};
% Weights of Edges
weights = [58, 80, 92, 71, 35, 40, 73, 21, 21, 169, 18];

% GRAPH
G = graph(s, t, weights);
figure('Color', [1 1 1]);
p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', 2, 'MarkerSize', 10);
layout(p, 'force');
title('BulSU Pedestrian Network Gate 1 to Federizo Hall');

% Shortest Path from Gate 1 to Federizo Hall
[path, d] = shortestpath(G, 'G1', 'FH');
highlight(p, path, 'EdgeColor', 'r', 'LineWidth', 4);

% Result (Highlighting path from Gate 1 to Federizo Hall)
fprintf('Shortest Path from Gate 1 to FH: %.2f meters\n', d);
fprintf('Path: %s\n', strjoin(path, ' -> '));

Shortest Path from Gate 1 to FH: 301.00 meters
Path: G1 -> AC -> CICT -> CoEd -> FH
>> 
