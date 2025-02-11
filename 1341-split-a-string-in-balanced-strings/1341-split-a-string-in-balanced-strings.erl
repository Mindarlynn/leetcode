-spec balanced_string_split(S :: unicode:unicode_binary()) -> integer().

split(List, Chk, true, Result) when Chk =:= 0 -> split(List, 0, false, Result + 1);
split([], _, _, Result) -> Result;
split([H | T], Chk, _, Result) when H =:= $R -> split(T, Chk + 1, true, Result);
split([H | T], Chk, _, Result) when H =:= $L -> split(T, Chk - 1, true, Result).

balanced_string_split(S) ->
    split(binary_to_list(S), 0, false, 0).