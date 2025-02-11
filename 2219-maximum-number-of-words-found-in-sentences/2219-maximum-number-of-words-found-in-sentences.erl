-spec most_words_found(Sentences :: [unicode:unicode_binary()]) -> integer().
most_words_found(Sentences) ->
    lists:foldl(
        fun (E, Acc) -> 
            max(Acc, length([X || X <- binary_to_list(E), X =:= 32 ]))
        end,
        0, Sentences
    ) + 1.