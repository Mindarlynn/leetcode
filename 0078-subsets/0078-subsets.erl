-spec subsets(Nums :: [integer()]) -> [[integer()]].

make(N, _, Tmp, Cnt) when Cnt =:= N -> [Tmp];
make(_, [], _, _) -> [];
make(N, [H | T], Tmp, Cnt) -> 
    make(N, T, Tmp ++ [H], Cnt + 1) ++
    make(N, T, Tmp, Cnt).

subsets(Nums) ->
    lists:foldl(
        fun(N, Ans) ->
            Ans ++ make(N, Nums, [], 0)
        end, [], lists:seq(0, length(Nums))
    ).