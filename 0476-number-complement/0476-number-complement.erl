-spec find_complement(Num :: integer()) -> integer().

f(E) when E == $0 -> $1;
f(E) when E == $1 -> $0.

flip(X) -> flip(X, []).
flip([], L) -> L;
flip([X | Xs], L) -> flip(Xs, L ++ [f(X)]).

find_complement(Num) ->
    list_to_integer(flip(integer_to_list(Num, 2)), 2).