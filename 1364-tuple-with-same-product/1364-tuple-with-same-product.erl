-spec freq(List :: [integer()]) -> map().
freq(List)          -> freq(List, maps:new()).

-spec freq(List :: [integer()], Map :: map()) -> map().
freq([], Map)       -> Map;
freq([H|T], Map)    -> freq(T, maps:update_with(H, fun(X) -> X + 1 end, 1, Map)).

-spec tuple_same_product(Nums :: [integer()]) -> integer().
tuple_same_product(Nums) ->
    Zipped = lists:zip(lists:seq(1, length(Nums)), Nums),
    lists:sum([4 * X * (X - 1) || X <- maps:values(freq([X * Y || {XI, X} <- Zipped, {YI, Y} <- Zipped, XI < YI])), X > 1]).