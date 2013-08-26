join_list([],L,L):-!.
join_list(L,[],L):-!.
join_list([F|R],L,[F|LS]):-join_list(R,L,LS).

