-spec max_absolute_sum(Nums :: [integer()]) -> integer().
max_absolute_sum(Nums) ->
    element(3, lists:foldl(
        fun(X, {Max, Min, Res}) ->
            NewMax = max(0, X + Max),
            NewMin = min(0, X + Min),
            {NewMax, NewMin, max(Res, max(NewMax, -NewMin))}
        end, {0, 0, 0}, Nums
    )).