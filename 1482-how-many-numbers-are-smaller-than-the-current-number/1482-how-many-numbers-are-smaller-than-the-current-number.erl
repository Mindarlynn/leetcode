-spec smaller_numbers_than_current(Nums :: [integer()]) -> [integer()].
smaller_numbers_than_current(Nums) ->
    lists:map(
        fun (E) ->
            length([X || X <- Nums, X < E])
        end,
        Nums
    ).