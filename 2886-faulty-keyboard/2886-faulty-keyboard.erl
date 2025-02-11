-spec final_string(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

final_string_impl([], Prev) -> Prev;
final_string_impl([H | T], Prev) when H =:= $i ->
    final_string_impl(T, lists:reverse(Prev));
final_string_impl([H | T], Prev) ->
    final_string_impl(T, Prev ++ [H]).


final_string(S) ->
    list_to_binary(final_string_impl(binary_to_list(S), [])).