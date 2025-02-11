-spec first_uniq_char(S :: unicode:unicode_binary()) -> integer().

count(C, Map) ->
    case maps:is_key(C, Map) of
        true -> maps:update(C, maps:get(C, Map) + 1, Map);
        false -> maps:put(C, 1, Map)
    end.

find([], _, _) -> -1;
find([H | T], Map, Idx) ->
    case maps:get(H, Map) of
        1 -> Idx;
        _ -> find(T, Map, Idx + 1)
    end.

real_first_uniq_char(S) ->
    Map = lists:foldl(fun count/2, maps:new(), S),
    find(S, Map, 0).

first_uniq_char(S) ->
    real_first_uniq_char(binary_to_list(S)).