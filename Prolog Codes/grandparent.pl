parent(p,b).
parent(t,b).
parent(b,a).
parent(b,c).
parent(c,j).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
