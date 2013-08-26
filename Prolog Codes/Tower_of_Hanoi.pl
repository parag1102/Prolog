toh(A,B,C,1):-write(1),!.
toh(A,B,C,N):-N1 is (N-1),toh(A,C,B,N1),write(N),toh(B,A,C,N1).
