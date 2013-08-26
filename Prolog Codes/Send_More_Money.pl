remove([F|R],X,R):-F is X,!.
remove([F|R],X,[F|Rest]):-remove(R,X,Rest).

distinct_t([S,E,N,D,M,O,R]):-
member(S,[0,1,2,3,4,5,6,7,8,9]),
remove([0,1,2,3,4,5,6,7,8,9],S,LE),member(E,LE),
remove(LE,E,LN),member(N,LN),
remove(LN,N,LD),member(D,LD),
remove(LD,D,LM),member(M,LM),
remove(LM,M,LO),member(O,LO),
remove(LO,O,LR),member(R,LR).

value([S,E,N,D],Val):-
member(S,[0,1,2,3,4,5,6,7,8,9]),
S>((Val/1000)-1),S < (Val/1000),

remove([0,1,2,3,4,5,6,7,8,9],S,LE),member(E,LE),
E>(((Val-(S*1000))/100)-1),E < (Val-(S*1000))/100,

remove(LE,E,LN),member(N,LN),
N>(((Val-((S*1000)+(E*100)))/10)-1),N < (Val-((S*1000)+(E*100)))/10,

D is (Val-((S*1000)+(E*100)+(N*10))),!.

value([S,E,N,D,M],Val):-
member(S,[0,1,2,3,4,5,6,7,8,9]),
S>((Val/10000)-1),S < (Val/10000),

remove([0,1,2,3,4,5,6,7,8,9],S,LE),member(E,LE),
E>(((Val-(S*10000))/1000)-1),E < (Val-(S*10000))/1000,

remove(LE,E,LN),member(N,LN),
N>(((Val-((S*10000)+(E*1000)))/100)-1),N < (Val-((S*10000)+(E*1000)))/100,

remove(LN,N,LD),member(D,LD),
D>(((Val-((S*10000)+(E*1000)+(N*100)))/10)-1),D < (Val-((S*10000)+(E*1000)+(N*100)))/10,

M is (Val-((S*10000)+(E*1000)+(N*100)+(D*10))),!.

