edge(p,b).
edge(b,p).
edge(t,b).
edge(b,a).
edge(b,c).
edge(c,j).
path(U,V):-edge(U,V).
path(U,V):-edge(U,X),path(X,V).
connected([]).
connected([U]).
connected([U,V]):-path(U,V),path(V,U).
connected([U|[V|Rest]]):-path(U,V),path(V,U),connected([U|Rest]),connected(Rest).

