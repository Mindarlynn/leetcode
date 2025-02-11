-spec find_the_difference(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> char().
find_the_difference(S, T) ->
    lists:nth(1, binary_to_list(T) -- binary_to_list(S)).