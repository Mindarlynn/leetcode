-spec count_segments(S :: unicode:unicode_binary()) -> integer().


count(Str, Cnt) ->
    case length(binary_to_list(Str)) of
        0 -> Cnt;
        _ -> Cnt + 1
    end.

count_segments(_, Len) when Len == 0 -> 0;
count_segments(S, _) ->
    lists:foldl(fun count/2, 0, re:split(S, " ")).

count_segments(S) ->
    SS = binary_to_list(S),
    count_segments(SS, length(SS)).
