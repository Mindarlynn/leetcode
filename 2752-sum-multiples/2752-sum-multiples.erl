-spec sum_of_multiples(N :: integer()) -> integer().

check_divisible(Val) when Val rem 3 =:= 0; Val rem 5 =:= 0; Val rem 7 =:= 0 -> Val;
check_divisible(_) -> 0.

sum_of_multiples(N) ->
    lists:foldl(
        fun (X, Sum) ->
            Sum + check_divisible(X)
        end, 0, lists:seq(1, N)
    ).