partition([],[],[]):-!.
partition([F],[F],[]):-!.
partition([First|Rest],[First|Rest1],L):-last(Rest,Last),remove(Rest,Last,R),partition(R,Rest1,Rest2),join_list(Rest2,[Last],L).

