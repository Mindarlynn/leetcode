-spec is_palindrome(X :: integer()) -> boolean().

reverse([]) -> [];
reverse([X | Xs]) ->
    reverse(Xs) ++ [X].   

is_palindrome(X) ->
  XX = integer_to_list(X),
  XX == reverse(XX).