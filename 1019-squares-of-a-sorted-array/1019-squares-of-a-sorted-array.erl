-spec sorted_squares(Nums :: [integer()]) -> [integer()].
sorted_squares(Nums) ->
    lists:sort(lists:map(fun(X) -> X * X end, Nums)).