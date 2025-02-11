-spec find_center(Edges :: [[integer()]]) -> integer().

count([], Map) -> Map;
count([[N1, N2] | T], Map) ->
    NewMap1 = case maps:find(N1, Map) of
        {ok, Value1} -> maps:update(N1, Value1 + 1, Map);
        _ -> maps:put(N1, 1, Map)
    end,
    NewMap2 = case maps:find(N2, NewMap1) of
        {ok, Value2} -> maps:update(N2, Value2 + 1, NewMap1);
        _ -> maps:put(N2, 1, NewMap1)
    end,
    count(T, NewMap2).

find_center(Edges) ->
    {Result, _} = maps:fold(
        fun (Key, Val, {MaxKey, MaxVal}) ->
            case Val > MaxVal of
                true -> {Key, Val};
                false -> {MaxKey, MaxVal}
            end
        end,
        {0, 0}, count(Edges, maps:new())
    ), 
    Result.