make_sublist_sets(List, TargetLen, [H | T], TargetLen, TmpMap, Result) -> 
    NewMap = case maps:get(H, TmpMap) of
        1 -> maps:remove(H, TmpMap);
        Value -> maps:update(H, Value - 1, TmpMap);
        _ -> TmpMap
    end,
    make_sublist_sets(List, TargetLen, T, TargetLen - 1, NewMap, Result ++ [maps:to_list(TmpMap)]);
make_sublist_sets([], _, _, _, _, Result) -> Result;
make_sublist_sets([H | T], TargetLen, Tmp, TmpLen, TmpMap, Result) ->
    NewMap = case maps:find(H, TmpMap) of
        {ok, Value} -> maps:update(H, Value + 1, TmpMap);
        _ -> maps:put(H, 1, TmpMap)
    end,
    make_sublist_sets(T, TargetLen, Tmp ++ [H], TmpLen + 1, NewMap, Result).

check([], _) -> false;
check([H | T], Set) ->
    case H =:= Set of
        true -> true;
        _ -> check(T, Set)
    end.

-spec check_inclusion(S1 :: unicode:unicode_binary(), S2 :: unicode:unicode_binary()) -> boolean().
check_inclusion(S1, S1) -> true;
check_inclusion(S1, S2) ->
    {SS1, SS2} = {binary_to_list(S1), binary_to_list(S2)},
    check(
        make_sublist_sets(SS2, length(SS1), [], 0, maps:new(), []), 
        maps:to_list(lists:foldl(
            fun(X, Map) ->
                case maps:find(X, Map) of
                    {ok, Value} -> maps:update(X, Value + 1, Map);
                    _ -> maps:put(X, 1, Map)
                end
            end, maps:new(), SS1
        )
    )).
    