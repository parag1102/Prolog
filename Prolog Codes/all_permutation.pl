join_list([],L,L):-!.
join_list(L,[],L):-!.
join_list([F|R],L,[F|LS]):-join_list(R,L,LS).

join_with_every_element(E,[],[]):-!.
join_with_every_element(E,[F|R],[L|List_of_List]):-join_list([E],F,L),join_with_every_element(E,R,List_of_List).

add_everywhere(X,[],[[X]]):-!.
add_everywhere(X,[First|Rest],[[X|[First|Rest]]|L]):-add_everywhere(X,Rest,L1),join_with_every_element(First,L1,L).

append_to_every(X,[],[]):-!.
append_to_every(X,[F|Rest],Result):-add_everywhere(X,F,L1),append_to_every(X,Rest,List_of_List),join_list(L1,List_of_List,Result).

permute([X,Y],[[X,Y],[Y,X]]):-!.
permute([F|Rest],Result):-permute(Rest,L),append_to_every(F,L,Result).

check_sorted([]):-!.
check_sorted([X]):-!.
check_sorted([F|[S|Rest]]):-F>S,!,fail.
check_sorted([F|[S|Rest]]):-check_sorted([S|Rest]).

produce_sorted([],L):-!,fail.
produce_sorted([F|Rest],F):-check_sorted(F),!.
produce_sorted([F|Rest],Result):-produce_sorted(Rest,Result).

sort_t([],[]):-!.
sort_t(L,Result):-permute(L,X),produce_sorted(X,Result).
