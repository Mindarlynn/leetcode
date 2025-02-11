same({A, A, A}) -> 1;
same(_) -> 0.

-spec arithmetic_triplets(Nums :: [integer()], Diff :: integer()) -> integer().
arithmetic_triplets(Nums, Diff) ->
    Enum = lists:enumerate(Nums),
    lists:foldl(
        fun ({I, J, K}, Cnt) ->
            Cnt + same({J - I, K - J, Diff})
        end,
        0, [{A, B, C} || {AIdx, A} <- Enum, {BIdx, B} <- Enum, {CIdx, C} <- Enum, AIdx < BIdx, BIdx < CIdx]
    ).