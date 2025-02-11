-spec hamming_distance(X :: integer(), Y :: integer()) -> integer().

count(L, E) -> length([X || X <- L, X == E]).

dist(X, Y) -> dist(X, Y, 0).
dist([], Y, Dist) -> Dist + count(Y, $1);
dist(X, [], Dist) -> Dist + count(X, $1);
dist([X | Xs], [Y | Ys], Dist) ->
    NewDist = case X == Y of
        true -> Dist;
        false -> Dist + 1
    end,
    dist(Xs, Ys, NewDist).

hamming_distance(X, Y) ->
    XX = lists:reverse(integer_to_list(X, 2)),
    YY = lists:reverse(integer_to_list(Y, 2)),
    io:format("~p~n~p~n", [XX, YY]),
    dist(XX, YY).