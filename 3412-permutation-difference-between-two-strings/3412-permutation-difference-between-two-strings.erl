-spec find_permutation_difference(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> integer().

map_characters([], _, Map) -> Map;
map_characters([H | T], Idx, Map) -> map_characters(T, Idx + 1, maps:put(H, Idx, Map)).

calc_score([], _, _) -> 0;
calc_score(_, [], _) -> 0;
calc_score([H1 | T1], [H2 | T2], Map) ->
    abs(maps:get(H1, Map) - maps:get(H2, Map)) + calc_score(T1, T2, Map).

find_permutation_difference(S, T) ->
    {SS, TT} = {binary_to_list(S), binary_to_list(T)},
    Map = map_characters(SS, 0, maps:new()),
    calc_score(SS, TT, Map).
