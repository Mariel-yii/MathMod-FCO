>> 
% EDGES & WEIGHTS
s = {'G1', 'AC', 'G2', 'CICT', 'CICT', 'ELib', 'CSSP', 'CSSP', 'G3', 'VH', 'FE'};
t = {'AC', 'CICT', 'CICT', 'ELib', 'FH', 'CSSP', 'G4', 'FH', 'VH', 'FE', 'FH'};
weights = [49, 88, 103, 149, 175, 45, 30, 45, 75, 85, 10];

% GRAPH
G = graph(s, t, weights);
figure('Color', [1 1 1]);
p = plot(G, 'EdgeLabel', G.Edges.Weight, 'LineWidth', 2, 'MarkerSize', 7);
layout(p, 'force');
title('BulSU Pedestrian Network - Final Mathematical Model');

% Shortest Path from Gate 1 to Federizo Hall
[path, d] = shortestpath(G, 'G1', 'FH');
highlight(p, path, 'EdgeColor', 'r', 'LineWidth', 4);

% RESULTS
fprintf('Shortest Path Distance: %.2f meters\n', d);
fprintf('Route: %s\n', strjoin(path, ' -> '));
Shortest Path Distance: 312.00 meters
Route: G1 -> AC -> CICT -> FH
>> 
