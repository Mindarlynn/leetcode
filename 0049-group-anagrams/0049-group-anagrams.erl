-spec group_anagrams(Strs :: [unicode:unicode_binary()]) -> [[unicode:unicode_binary()]].

make_group(List) -> make_group(List, maps:new()).
make_group([], Map) -> Map;
make_group([H | T], Map) ->
    Sorted = lists:sort(H),
    make_group(T, 
        case maps:is_key(Sorted, Map) of
            true -> maps:update(Sorted, maps:get(Sorted, Map) ++ [list_to_binary(H)], Map);
            false -> maps:put(Sorted, [list_to_binary(H)], Map)
        end
    ).

group_anagrams(Strs) ->
    [L || {_, L} <- maps:to_list(make_group([binary_to_list(X) || X <- Strs]))].
    