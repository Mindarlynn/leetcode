freq(List) -> freq(List, maps:new()).
freq([], Map) -> Map;
freq([H | T], Map) -> freq(T, maps:update_with(H, fun(X) -> X + 1 end, 1, Map)).

-spec num_tile_possibilities(Tiles :: unicode:unicode_binary()) -> integer().
num_tile_possibilities(<<Tiles/binary>>) ->
    num_tile_possibilities(binary_to_list(Tiles));

num_tile_possibilities(Tiles) ->
    Alphas = freq(Tiles),
    Keys = maps:keys(Alphas),
    lists:foldl(
        fun(K, Acc) ->
            Acc + bcktrack(Alphas, Keys, K, 0)
        end, 0, lists:seq(1, length(Tiles))
    ).

bcktrack(_, _, K, K) -> 1;
bcktrack(Alphas, Keys, K, L) ->
    lists:foldl(
        fun(Ch, Acc) ->
            case maps:get(Ch, Alphas) of
                0 -> 0;
                Val -> bcktrack(maps:update(Ch, Val - 1, Alphas), Keys, K, L + 1)
            end + Acc
        end, 0, Keys
    ).