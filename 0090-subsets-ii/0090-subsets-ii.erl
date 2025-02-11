-spec subsets_with_dup(Nums :: [integer()]) -> [[integer()]].

make(N, _, Tmp, Cnt) when Cnt =:= N -> [lists:sort(Tmp)];
make(_, [], _, _) -> [];
make(N, [H | T], Tmp, Cnt) -> 
    make(N, T, Tmp ++ [H], Cnt + 1) ++
    make(N, T, Tmp, Cnt).

subsets_with_dup(Nums) ->
    sets:to_list(sets:from_list(lists:foldl(
        fun(N, Ans) ->
            Ans ++ make(N, Nums, [], 0)
        end, [], lists:seq(1, length(Nums))
    ))) ++ [[]].