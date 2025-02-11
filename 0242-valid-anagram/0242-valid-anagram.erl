-spec is_anagram(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> boolean().

count(L) -> count(L, maps:new()).
count([], Map) -> Map;
count([H | T], Map) -> 
    case maps:is_key(H, Map) of
        true -> count(T, maps:update(H, maps:get(H, Map) + 1, Map));
        _ -> count(T, maps:put(H, 1, Map))
    end.

is_anagram(S, T) ->
    SS = binary_to_list(S),
    TT = binary_to_list(T),
    count(SS) == count(TT).