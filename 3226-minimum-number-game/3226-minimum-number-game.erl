-spec number_game(Nums :: [integer()]) -> [integer()].

number_game_impl(Nums) -> number_game_impl(Nums, []).
number_game_impl([], Result) -> Result;
number_game_impl([H1 | [H2 | T]], Result) -> number_game_impl(T, Result ++ [H2, H1]).
    

number_game(Nums) ->
    number_game_impl(lists:sort(Nums)).