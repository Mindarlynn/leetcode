-spec check_arithmetic_subarrays(Nums :: [integer()], L :: [integer()], R :: [integer()]) -> [boolean()].

skip(_, 0, 0) -> [];
skip([H | T], 0, Len) -> [H] ++ skip(T, 0, Len - 1);
skip([_ | T], L, Len) -> skip(T, L - 1, Len).

check([_ | []], _) -> true;
check([H | T], Diff) ->
    case hd(T) - H =:= Diff of
        true -> check(T, Diff);
        false -> false
    end.

check_arithmetic_subarrays(Nums, L, R) ->
    lists:map(
        fun({L, R}) ->
            [H | T] = lists:sort(skip(Nums, L, R - L + 1)),
            check([H | T], hd(T) - H)
        end, lists:zip(L, R)
    ).