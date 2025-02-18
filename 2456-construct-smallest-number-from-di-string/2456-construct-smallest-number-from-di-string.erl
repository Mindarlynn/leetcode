-spec smallest_number(Pattern :: unicode:unicode_binary()) -> unicode:unicode_binary().
smallest_number(<<Pattern/binary>>) ->
    smallest_number(binary_to_list(Pattern));

smallest_number(Pattern) ->
    N = length(Pattern),
    list_to_binary(helper(lists:zip(lists:seq(0, N - 1), Pattern), [], N, [])).


helper_helper([], Res) -> Res;
helper_helper([H | T], Res) -> helper_helper(T, [H] ++ Res).

helper([], Stack, Len, Res) -> lists:reverse(helper_helper([$1 + Len] ++ Stack, Res));
helper([{Idx, Val} | T], Stack, Len, Res) when Val == $I -> helper(T, [], Len, helper_helper([$1 + Idx] ++ Stack, Res));
helper([{Idx, Val} | T], Stack, Len, Res) -> helper(T, [$1 + Idx] ++ Stack, Len, Res).