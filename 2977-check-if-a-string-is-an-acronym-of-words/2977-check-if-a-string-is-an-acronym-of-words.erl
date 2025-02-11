-spec is_acronym(Words :: [unicode:unicode_binary()], S :: unicode:unicode_binary()) -> boolean().
is_acronym(Words, S) ->
    [hd(binary_to_list(X)) || X <- Words] =:= binary_to_list(S).