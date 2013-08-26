remove([F|R],X,R):-F is X,!.
remove([F|R],X,[F|Rest]):-remove(R,X,Rest).
