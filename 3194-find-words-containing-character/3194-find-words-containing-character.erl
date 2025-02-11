-spec find_words_containing(Words :: [unicode:unicode_binary()], X :: char()) -> [integer()].

find_words_containing_impl([], _) -> [];
find_words_containing_impl([{Idx, Word} | T], X) ->
    case lists:member(X, Word) of
        true -> [Idx - 1] ++ find_words_containing_impl(T, X);
        false -> find_words_containing_impl(T, X)
    end.

find_words_containing(Words, X) ->
    NewWords = [binary_to_list(X) || X <- Words],
    find_words_containing_impl(lists:enumerate(NewWords), X).