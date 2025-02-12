helper([], []) -> true;
helper([], _) -> false;
helper([$( | T], Stack) -> helper(T, [$(] ++ Stack);
helper([$) | T], [$( | Stack]) -> helper(T, Stack);
helper([$) | T], _) -> false;
helper([$[ | T], Stack) -> helper(T, [$[] ++ Stack);
helper([$] | T], [$[ | Stack]) -> helper(T, Stack);
helper([$] | T], _) -> false;
helper([${ | T], Stack) -> helper(T, [${] ++ Stack);
helper([$} | T], [${ | Stack]) -> helper(T, Stack);
helper([$} | T], _) -> false.


-spec is_valid(S :: unicode:unicode_binary()) -> boolean().
is_valid(S) ->
    helper(binary_to_list(S), []).