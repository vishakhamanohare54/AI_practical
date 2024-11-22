% Define the edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).

% Define the BFS rule
bfs(Start, Goal, Path) :- bfs_helper([Start], Goal, [], Path).

% Base case: Goal is the head of the queue
bfs_helper([Goal|RestPath], Goal, Path, Result) :-
    reverse([Goal|RestPath], Result).

% Recursive case: Explore the neighbors
bfs_helper([Current|RestPath], Goal, Visited, Result) :-
    findall(Next, (edge(Current, Next), \+ member(Next, [Current|Visited])), Neighbors),
    append(RestPath, Neighbors, NewPath),
    bfs_helper(NewPath, Goal, [Current|Visited], Result).
	
% Query to find a path from 'a' to 'd'
?- bfs(a, d, Path).
