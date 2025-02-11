-spec convert_to_base7(Num :: integer()) -> unicode:unicode_binary().
convert_to_base7(Num) ->
    list_to_binary(integer_to_list(Num, 7)).