-spec partition_labels(S :: unicode:unicode_binary()) -> [integer()].
partition_labels(<<S/binary>>) -> partition_labels(binary_to_list(S));
partition_labels(S) ->
    PosMap = element(1, lists:foldl(
        fun(X, {Map, Idx}) ->
            {maps:update_with(X, fun(_) -> Idx end, Idx, Map), Idx + 1}
        end, {maps:new(), 0}, S
    )),
    element(1, lists:foldl(
        fun(X, {Result, Prev, Max, Idx}) ->
            NewMax = max(Max, maps:get(X, PosMap)),
            if
                Idx == NewMax ->
                    {Result ++ [NewMax - Prev], NewMax, NewMax, Idx + 1};
                true ->
                    {Result, Prev, NewMax, Idx + 1}
            end
        end, {[], -1, 0, 0}, S
    )).