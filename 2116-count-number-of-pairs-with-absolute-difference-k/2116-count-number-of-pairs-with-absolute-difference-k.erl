-spec count_k_difference(Nums :: [integer()], K :: integer()) -> integer().
count_k_difference(Nums, K) ->
    Enum = lists:enumerate(Nums),
    length([1 || {XIdx, X} <- Enum, {YIdx, Y} <- Enum, XIdx < YIdx, abs(X - Y) =:= K]).