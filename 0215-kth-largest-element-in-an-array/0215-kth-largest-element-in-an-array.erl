-spec find_kth_largest(Nums :: [integer()], K :: integer()) -> integer().
find_kth_largest(Nums, K) ->
    lists:nth(K, lists:reverse(lists:sort(Nums))).