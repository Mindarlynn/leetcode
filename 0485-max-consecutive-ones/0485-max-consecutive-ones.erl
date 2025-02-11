-spec find_max_consecutive_ones(Nums :: [integer()]) -> integer().

find(X) -> find(X, 0, 0).
find([], Count, Max) -> lists:max([Count, Max]);
find([X | Xs], Count, Max) when X == 0 -> 
    find(Xs, 0, lists:max([Count, Max]));
find([X | Xs], Count, Max) ->
    find(Xs, Count + 1, Max).
    

find_max_consecutive_ones(Nums) ->
    find(Nums).