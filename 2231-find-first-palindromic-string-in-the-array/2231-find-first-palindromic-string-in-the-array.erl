-spec first_palindrome(Words :: [unicode:unicode_binary()]) -> unicode:unicode_binary().

split(List) -> split(List, [], length(List) div 2).
split(A, B, 0) -> {lists:reverse(A), B};
split([H | T], B, Len) ->
    split(T, B ++ [H], Len - 1).

is_palindrome({A, B}) -> is_palindrome(A, B).
is_palindrome([], _) -> true;
is_palindrome(_, []) -> true;
is_palindrome([H | T1], [H | T2]) -> is_palindrome(T1, T2);
is_palindrome(_, _) -> false.

return_result([]) -> list_to_binary([]);
return_result([H | _]) -> H.

first_palindrome(Words) ->
    return_result(
        lists:foldl(
            fun(X, Res) ->
                case is_palindrome(split(binary_to_list(X))) of
                    true -> Res ++ [X];
                    false -> Res
                end
            end, [], Words
        )
    ).