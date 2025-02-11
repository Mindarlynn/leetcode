-spec to_lower_case(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

tlc([]) -> [];
tlc([H | T]) when H >= $A, H =< $Z ->
    [H + 32] ++ tlc(T);
tlc([H | T]) ->
    [H] ++ tlc(T).

to_lower_case(S) ->
    list_to_binary(tlc(binary_to_list(S))).