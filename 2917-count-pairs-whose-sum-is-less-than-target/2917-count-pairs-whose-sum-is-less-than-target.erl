-spec count_pairs(Nums :: [integer()], Target :: integer()) -> integer().

count_pairs_impl(Nums, Target) -> count_pairs_impl(Nums, Target, 0).
count_pairs_impl([], _, Cnt) -> Cnt;
count_pairs_impl([H | T], Target, Cnt) ->
    count_pairs_impl(T, Target, Cnt + length([X || X <- T, H + X < Target])).

count_pairs(Nums, Target) ->
    count_pairs_impl(Nums, Target).