-spec can_alice_win(Nums :: [integer()]) -> boolean().
can_alice_win(Nums) ->
    lists:sum([X || X <- Nums, X < 10]) =/= lists:sum([X || X <- Nums, X >= 10]).