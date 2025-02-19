map_inc(Key, Map) -> maps:update_with(Key, fun(X) -> X + 1 end, 1, Map).
map_dec(Key, Map) -> 
    case maps:get(Key, Map) of
        1 -> maps:remove(Key, Map);
        Val -> maps:update(Key, Val - 1, Map)
    end.

freq([]) -> maps:new();
freq([H | T]) -> map_inc(H, freq(T)).

-spec check_inclusion(S1 :: unicode:unicode_binary(), S2 :: unicode:unicode_binary()) -> boolean().
check_inclusion(<<S1/binary>>, <<S2/binary>>) ->
    check_inclusion(binary_to_list(S1), binary_to_list(S2));
check_inclusion(S1, S1) -> true;
check_inclusion(S1, S2) ->
    Len = length(S1),
    Map = freq(S1),
    helper(Map, Len, S2, maps:new(), 0, []).

helper(Map1, S1Len, [], Map2, S2Len, ToDel) when S1Len > S2Len -> false;
helper(Map1, S1Len, [H | T], Map2, S2Len, ToDel) when S1Len > S2Len -> 
    helper(Map1, S1Len, T, map_inc(H, Map2), S2Len + 1, ToDel ++ [H]);
helper(Map1, Len, [], Map2, Len, _) -> Map1 == Map2;
helper(Map, Len, _, Map, Len, _) -> true;
helper(Map1, Len, [H1 | T1], Map2, Len, [H2 | T2]) ->
    helper(Map1, Len, T1, map_inc(H1, map_dec(H2, Map2)), Len, T2 ++ [H1]).