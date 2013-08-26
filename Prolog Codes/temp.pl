remove_t([F|R],F,R):-!.
remove_t([F|R],X,[F|R1]):-remove(R,X,R1).

join_list_t([],L,L):-!.
join_list_t(L,[],L):-!.
join_list_t([F|R],L,[F|Ls]):-join_list_t(R,L,Ls).

concat_t([],[]).
concat_t([F|Rest],L):-concat_t(Rest,Res1),join_list_t(F,Res1,L).

merge_t([],L,L):-!.
merge_t(L,[],L):-!.
merge_t([F|R],[First|Rest],[F|Result]):-F<First,merge_t(R,[First|Rest],Result),!.
merge_t([F|R],[First|Rest],[First|Result]):-F>=First,merge_t([F|R],Rest,Result).

/*Or you can use the direct function last(List,Last_elem)*/
last_elem([F],F):-!.
last_elem([First|Rest],X):-last_elem(Rest,X).

partition_t([],[],[]):-!.
partition_t([X],[X],[]):-!.
partition_t([F|R],[F|Half1],SHalf):-last_elem(R,X),join_list_t(Mid,[X],R),partition_t(Mid,Half1,Half2),join_list_t(Half2,[X],SHalf).

merge_sort([],[]):-!.
merge_sort([X],[X]):-!.
merge_sort(L,Sorted):-partition_t(L,L1,L2),merge_sort(L1,T1),merge_sort(L2,T2),merge_t(T1,T2,Sorted).

path(U,U):-!,fail.
path(U,V):-edge(U,V).
path(U,V):-edge(U,X),path(X,V).

check_sorted([]):-!.
check_sorted([X]):-!.
check_sorted([F|[S|Rest]]):-F>S,!,fail.
check_sorted([F|[S|Rest]]):-check_sorted([S|Rest]).

produce_sorted([],L):-!,fail.
produce_sorted([F|Rest],F):-check_sorted(F),!.
produce_sorted([F|Rest],Result):-produce_sorted(Rest,Result).

sort_t([],[]):-!.
sort_t(L,Result):-permute(L,X),produce_sorted(X,Result).

