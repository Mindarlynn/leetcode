-spec longest_palindrome(S :: unicode:unicode_binary()) -> integer().

count(C, Map) ->
    case maps:is_key(C, Map) of
        true -> maps:update(C, maps:get(C, Map) + 1, Map);
        false -> maps:put(C, 1, Map)
    end.

odd_count(C, {Map, Cnt}) ->
    Val = maps:get(C, Map),
    case Val rem 2 of
        0 -> {Map, Cnt};
        1 -> {Map, Cnt + 1}
    end.

result(N, OddCount) when OddCount == 0 ->
    N;
result(N, OddCount) ->
    N - OddCount + 1.

real_longest_palindrome(S) ->
    Map = lists:foldl(fun count/2, maps:new(), S),
    SS = sets:to_list(sets:from_list(S)),
    {_, OddCount} = lists:foldl(fun odd_count/2, {Map, 0}, SS),
    result(length(S), OddCount).

longest_palindrome(S) ->
    real_longest_palindrome(binary_to_list(S)).