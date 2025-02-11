-spec restore_string(S :: unicode:unicode_binary(), Indices :: [integer()]) -> unicode:unicode_binary().
restore_string(S, Indices) ->
    list_to_binary([X || {_, X} <- lists:sort(lists:zip(Indices, binary_to_list(S)))]).