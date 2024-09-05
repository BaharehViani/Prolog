edge(a, b). 
edge(a, c).
edge(b, c).
edge(c, d). 
edge(e, d). 

connected(X,Y) :- edge(X,Y), !.
connected(X,Y) :- edge(Y,X).

di_path(X,Y,[X,Y]) :- edge(X,Y).
di_path(X,Y,[X|Path]) :- edge(X,Z), di_path(Z,Y,Path).

un_path(X,Y,[X,Y]) :- connected(X,Y).
un_path(X,Y,[X|Path]) :- connected(X,Z), un_path(Z,Y,Path).