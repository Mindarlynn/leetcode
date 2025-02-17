freq(List) -> freq(List, maps:new()).
freq([], Map) -> Map;
freq([H | T], Map) -> freq(T, maps:update_with(H, fun(X) -> X + 1 end, 1, Map)).

-spec num_tile_possibilities(Tiles :: unicode:unicode_binary()) -> integer().
num_tile_possibilities(Tiles) ->
    LTiles = binary_to_list(Tiles),
    Alphas = freq(LTiles),
    lists:sum(
        lists:map(
            fun(K) -> 
                bcktrack(Alphas, K, 0) 
            end, lists:seq(1, length(LTiles))
        )
    ).

bcktrack(Alphas, K, K) -> 1;
bcktrack(Alphas, K, L) ->
    lists:sum(
        lists:map(
            fun(Ch) ->
                case maps:get(Ch, Alphas, 0) of
                    0 -> 0;
                    Val -> bcktrack(maps:update(Ch, Val - 1, Alphas), K, L + 1)
                end
            end, lists:seq($A, $Z, 1)
        )
    ).