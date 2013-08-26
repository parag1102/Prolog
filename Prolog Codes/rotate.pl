join_list([],L,L):-!.
join_list(L,[],L):-!.
join_list([F|R],L,[F|LS]):-join_list(R,L,LS).

split_upto([],X,[],[]):-!.
split_upto([F|R],F,[F],R):-!.
split_upto([F|R],X,[F|Rest],L):-split_upto(R,X,Rest,L).

rotate([],X,[]):-!.
rotate(L,X,Result):-split_upto(L,X,L1,L2),join_list(L2,L1,Result).
