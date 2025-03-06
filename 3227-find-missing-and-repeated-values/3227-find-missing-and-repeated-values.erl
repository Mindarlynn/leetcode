freq([]) -> maps:new();
freq([H | T]) -> maps:update_with(H, fun(X) -> X + 1 end, 1, freq(T)).

-spec find_missing_and_repeated_values(Grid :: [[integer()]]) -> [integer()].
find_missing_and_repeated_values(Grid) ->
    Flat = lists:flatten(Grid),
    Freq = freq(Flat),
    {Dupl, Miss} = lists:foldl(
        fun(X,  {Dupl, Miss}) ->
            case maps:get(X, Freq, 0) of
                2 -> {Dupl ++ [X], Miss};
                0 -> {Dupl, Miss ++ [X]};
                _ -> {Dupl, Miss}
            end
        end, {[], []}, lists:seq(1, length(Flat))
    ),
    Dupl ++ Miss.