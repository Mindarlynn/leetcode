-spec length_of_last_word(S :: unicode:unicode_binary()) -> integer().

reverse([]) -> [];
reverse([H | T]) -> reverse(T) ++ [H].
top([H | _]) -> H.

length_of_last_word(S) ->
    length(top(reverse(string:tokens(binary_to_list(S), " ")))).