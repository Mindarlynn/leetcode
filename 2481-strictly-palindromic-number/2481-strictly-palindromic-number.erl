-spec is_strictly_palindromic(N :: integer()) -> boolean().

itol(N, Base) when N == 0 -> [];
itol(N, Base) ->
    itol(N div Base, Base) ++ [N rem Base].

isp(N, Base) when N == (Base - 1) -> [];
isp(N, Base)->
    L = itol(N, Base),
    [L == lists:reverse(L)] ++ isp(N, Base + 1).

check(L, E) -> length(L) == length([X || X <- L, X == E]).

is_strictly_palindromic(N) ->
    check(isp(N, 2), true).