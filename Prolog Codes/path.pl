edge(p,b).
edge(t,b).
edge(b,a).
edge(b,c).
edge(c,j).
path(U,V):-edge(U,V).
path(U,V):-edge(U,X),path(X,V).
