-spec freq(List :: [integer()]) -> map().
freq([])       -> maps:new();
freq([H|T])    -> maps:update_with(H, fun(X) -> X + 1 end, 1, freq(T)).

-spec tuple_same_product(Nums :: [integer()]) -> integer().
tuple_same_product(Nums) ->
    Zipped = lists:zip(lists:seq(1, length(Nums)), Nums),
    lists:sum([4 * X * (X - 1) || X <- maps:values(freq([X * Y || {XI, X} <- Zipped, {YI, Y} <- Zipped, XI < YI])), X > 1]).