freq([]) -> maps:new();
freq([H | T]) -> maps:update_with(H, fun(X) -> X + 1 end, 1, freq(T)).

-spec find_missing_and_repeated_values(Grid :: [[integer()]]) -> [integer()].
find_missing_and_repeated_values(Grid) ->
    L = lists:flatten(Grid),
    Freq = freq(L),
    NN = length(L),
    Res = lists:foldl(
        fun(X, Res) ->
            case maps:get(X, Freq, 0) of
                2 -> Res ++ [X];
                _ -> Res
            end
        end, [], lists:seq(1, NN)
    ),
    lists:foldl(
        fun(X, Res) ->
            case maps:get(X, Freq, 0) of
                0 -> Res ++ [X];
                _ -> Res
            end
        end, Res, lists:seq(1, NN)
    ).