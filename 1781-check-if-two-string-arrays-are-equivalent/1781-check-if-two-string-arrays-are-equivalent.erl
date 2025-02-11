-spec array_strings_are_equal(Word1 :: [unicode:unicode_binary()], Word2 :: [unicode:unicode_binary()]) -> boolean().
array_strings_are_equal(Word1, Word2) ->
    lists:foldl(
        fun (X, Res) ->
            Res ++ binary_to_list(X)
        end, [], Word1
    ) ==
    lists:foldl(
        fun (X, Res) ->
            Res ++ binary_to_list(X)
        end, [], Word2
    ).