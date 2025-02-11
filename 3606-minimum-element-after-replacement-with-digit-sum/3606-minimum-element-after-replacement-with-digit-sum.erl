-spec min_element(Nums :: [integer()]) -> integer().
min_element(Nums) ->
    lists:min(
        lists:map(
            fun(X) -> 
                lists:sum([X - $0 || X <- integer_to_list(X)])
            end, Nums
        )
    ).