-spec reverse_prefix(Word :: unicode:unicode_binary(), Ch :: char()) -> unicode:unicode_binary().

reverse_prefix_impl(Word, Ch) -> list_to_binary(reverse_prefix_impl(binary_to_list(Word), Ch, [], [], false)).
reverse_prefix_impl([], _, Tmp, Res, _) -> Res ++ Tmp;
reverse_prefix_impl([H | T], Ch, Tmp, Res, false) when H =:= Ch ->
    reverse_prefix_impl(T, Ch, [], Res ++ lists:reverse(Tmp ++ [H]), true);
reverse_prefix_impl([H | T], Ch, Tmp, Res, Found) ->
    reverse_prefix_impl(T, Ch, Tmp ++ [H], Res, Found).

reverse_prefix(Word, Ch) ->
    reverse_prefix_impl(Word, Ch).