join_list([],L,L):-!.
join_list(L,[],L):-!.
join_list([F|R],L,[F|LS]):-join_list(R,L,LS).

concat([],[]):-!.
concat([X],X):-!.
concat([F|[S|Rest]],Result):-join_list(F,S,L1),concat(Rest,L2),join_list(L1,L2,Result).
