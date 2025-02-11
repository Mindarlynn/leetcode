-spec word_pattern(Pattern :: unicode:unicode_binary(), S :: unicode:unicode_binary()) -> boolean().

allocate_alphabet([], _, Map, _) -> Map;
allocate_alphabet([X | Xs], [Y | Ys], Map, Set) ->
    case sets:is_element(X, Set) of
        true -> allocate_alphabet(Xs, Ys, Map, Set);
        false -> allocate_alphabet(Xs, Ys, maps:put(Y, X, Map), sets:add_element(X, Set))
    end.

read_pattern([], _, List) -> List;
read_pattern([X | Xs], Map, List) -> 
    read_pattern(Xs, Map, List ++ [maps:get(X, Map, "")]).

real_world_pattern(Tokens, Pattern) ->
    Map = allocate_alphabet(Tokens, Pattern, maps:new(), sets:new()),
    MadeByPattern = read_pattern(Pattern, Map, []),
    Tokens =:= MadeByPattern.

word_pattern(Pattern, S) ->
    Tokens = lists:map(fun binary_to_list/1, re:split(binary_to_list(S), " ")),
    PatternList = binary_to_list(Pattern),
    case length(Tokens) == length(PatternList) of
        true -> real_world_pattern(Tokens, PatternList);
        false -> false
    end.