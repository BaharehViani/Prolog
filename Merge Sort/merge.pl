mergesort([], []).
mergesort([X], [X]).
mergesort([X,Y|R], Sorted) :- split([X,Y|R], L1, L2),
                              mergesort(L1, SortedL1), 
                              mergesort(L2, SortedL2),
                              merge(SortedL1, SortedL2, Sorted).

split([], [], []).
split([X], [X], []).
split([X,Y|R], [X|Rx], [Y|Ry]) :- split(R, Rx, Ry).

merge([], L, L).
merge(L, [], L).
merge([X|Rx], [Y|Ry], [X|Merged]) :- X =< Y, merge(Rx, [Y|Ry], Merged).
merge([X|Rx], [Y|Ry], [Y|Merged]) :- Y < X, merge([X|Rx], Ry, Merged).