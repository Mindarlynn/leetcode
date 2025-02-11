-spec difference_of_sum(Nums :: [integer()]) -> integer().
difference_of_sum(Nums) ->
    lists:sum(Nums) - lists:sum(lists:flatten(lists:map(
        fun (X) ->
            lists:map(fun (Y) -> Y - $0 end, integer_to_list(X))
        end,
        Nums
    ))).