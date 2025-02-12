helper([], Stack) -> hd(Stack);
helper([[$+] | TOps], [R | [L | TStack]]) -> helper(TOps, [L + R] ++ TStack);
helper([[$-] | TOps], [R | [L | TStack]]) -> helper(TOps, [L - R] ++ TStack);
helper([[$*] | TOps], [R | [L | TStack]]) -> helper(TOps, [L * R] ++ TStack);
helper([[$/] | TOps], [R | [L | TStack]]) -> helper(TOps, [L div R] ++ TStack);
helper([H | T], Stack) -> helper(T, [list_to_integer(H)] ++ Stack).


-spec eval_rpn(Tokens :: [unicode:unicode_binary()]) -> integer().
eval_rpn(Tokens) ->
    helper(lists:map(fun binary_to_list/1, Tokens), []).