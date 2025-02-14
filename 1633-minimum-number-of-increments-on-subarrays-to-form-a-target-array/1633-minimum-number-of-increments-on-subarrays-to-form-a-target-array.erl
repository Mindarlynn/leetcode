-spec min_number_operations(Target :: [integer()]) -> integer().
min_number_operations(Target) ->
    hd(Target) + helper(Target).

helper([]) -> 0;
helper([A, B | T]) when B > A -> (B - A) + helper([B | T]);
helper([H | T]) -> helper(T).