remove([F|R],X,R):-F is X,!.
remove([F|R],X,[F|Rest]):-remove(R,X,Rest).

join_list([],L,L).
join_list(L,[],L).
join_list([F|R],L,[F|LS]):-join_list(R,L,LS).

partition([],[],[]).
partition([F],[F],[]).
partition([First|Rest],[First|Rest1],L):-last(Rest,Last),remove(Rest,Last,R),partition(R,Rest1,Rest2),join_list(Rest2,[Last],L).

merge([],L,L).
merge(L,[],L).
merge([First|Rest],[F|R],[First|LS]):-First<F,merge(Rest,[F|R],LS).
merge([First|Rest],[F|R],[F|LS]):-F=<First,merge([First|Rest],R,LS).

mergesort([],[]):-!.
mergesort([X],[X]):-!.
mergesort(List,Sorted):-partition(List,Half1,Half2),mergesort(Half1,List1),mergesort(Half2,List2),merge(List1,List2,Sorted).

