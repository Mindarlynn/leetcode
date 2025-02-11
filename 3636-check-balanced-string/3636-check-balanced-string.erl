-spec is_balanced(Num :: unicode:unicode_binary()) -> boolean().

is_balanced(Num) ->
    NNum = [X - $0 || X <- binary_to_list(Num)],
    lists:sum([X || {Idx, X} <- lists:zip(lists:seq(1, length(NNum)), NNum), Idx rem 2 =:= 0]) =:= lists:sum([X || {Idx, X} <- lists:zip(lists:seq(1, length(NNum)), NNum), Idx rem 2 =:= 1]).