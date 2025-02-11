-spec running_sum(Nums :: [integer()]) -> [integer()].

running_sum_impl([], _, Result) -> Result;
running_sum_impl([H | T], PrevSum, Result) -> running_sum_impl(T, PrevSum + H, Result ++ [PrevSum + H]).

running_sum(Nums) ->
    running_sum_impl(Nums, 0, []).