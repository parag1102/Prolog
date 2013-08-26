join_list([],[],[]):-!.
join_list([],L,L):-!.
join_list(L,[],L):-!.
join_list([F|R],L2,[F|R1]):-join_list(R,L2,R1).

split_upto([],X,[],[]):-!.
split_upto([F|R],F,[],[F|R]):-!.
split_upto([F|R],X,[F|R1],P2):-split_upto(R,X,R1,P2).

rotate_t([],X,[]):-!.
rotate_t(L,X,Res):-split_upto(L,X,P1,P2),join_list(P2,P1,Res).

remove([],X,[]):-!.
remove([F|R],F,R):-!.
remove([F|R],X,[F|R1]):-remove(R,X,R1).

subset([],[]):-!.
subset(Set,[]):-!.
subset([],Subset):-!,fail.
subset(Set,[F|R]):-member(F,Set),subset(Set,R).

subsum([],0,[]).
subsum(L,0,[]).
subsum(L,X,[F|R]):- \+(subset(L,[F|R])),!,fail.
subsum([F|R],F,[F]).
subsum([F|Rest],X,[F|R]):-X1 is (X-F),subsum(Rest,X1,R).
subsum([F|Rest],X,L):-subsum(Rest,X,L).

concat([],[]):-!.
concat([F],F):-!.
concat([F|R],Result):-concat(R,Res),join_list(F,Res,Result).
