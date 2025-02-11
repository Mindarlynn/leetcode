-spec third_max(Nums :: [integer()]) -> integer().

third_max(Nums, Len) when Len < 3 -> lists:max(Nums);
third_max(Nums, Len) ->
    lists:nth(Len - 3 + 1, lists:sort(Nums)).
third_max(Nums) ->
    DistinctNums = sets:to_list(sets:from_list(Nums)),
    third_max(DistinctNums, length(DistinctNums)).