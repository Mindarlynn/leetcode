incMap(X, Map) -> maps:update_with(X, fun(Y) -> Y + 1 end, 1, Map).
decMap(X, Map) -> maps:update_with(X, fun(Y) -> Y - 1 end, -1, Map).
updMap(X, Y, Map) -> maps:update_with(X, fun(_) -> Y end, Y, Map).
getMap(X, Map) -> maps:get(X, Map, 0).

handle_query_helper([], _) -> [];
handle_query_helper([H | T], Param) ->
    NextParam = handle_query(H, Param),
    [element(3, NextParam)] ++ handle_query_helper(T, NextParam).

handle_query([X | [Y | _]], {BallMap, ColorMap, Distinct}) ->
    _ColorMap1 = decMap(getMap(X, BallMap), ColorMap),
    _Distinct = Distinct - case getMap(getMap(X, BallMap), _ColorMap1) of
        0 -> 1;
        _ -> 0
    end,

    _BallMap = updMap(X, Y, BallMap),
    _ColorMap2 = incMap(Y, _ColorMap1),

    { _BallMap, _ColorMap2, _Distinct + case getMap(Y, _ColorMap2) of
        1 -> 1;
        _ -> 0
    end }.


-spec query_results(Limit :: integer(), Queries :: [[integer()]]) -> [integer()].
query_results(Limit, Queries) ->
    handle_query_helper(Queries, {#{}, #{}, 0}).