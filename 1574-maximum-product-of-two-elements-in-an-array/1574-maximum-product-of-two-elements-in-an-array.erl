-spec max_product(Nums :: [integer()]) -> integer().
max_product(Nums) ->
    [X | [Y | _]] = lists:sort(
        fun(A, B) ->
            A >= B
        end, Nums
    ),
    (X - 1) * (Y - 1).