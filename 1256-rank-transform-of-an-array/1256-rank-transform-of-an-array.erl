-spec array_rank_transform(Arr :: [integer()]) -> [integer()].

array_rank_transform(Arr) ->
    RankMap = lists:foldl(
        fun ({Idx, X}, Map) ->
            maps:put(X, Idx, Map)
        end, maps:new(), lists:enumerate(lists:usort(Arr))
    ),
    lists:map(
        fun (X) ->
            maps:get(X, RankMap)
        end, Arr
    ).