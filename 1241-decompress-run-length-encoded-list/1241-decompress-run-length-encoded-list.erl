-spec decompress_rl_elist(Nums :: [integer()]) -> [integer()].

decompress_rl_elist_impl(Nums) -> decompress_rl_elist_impl(Nums, []).
decompress_rl_elist_impl([], Result) -> Result;
decompress_rl_elist_impl([N | [Val | T]], Result) -> decompress_rl_elist_impl(T, Result ++ lists:duplicate(N, Val)).

decompress_rl_elist(Nums) ->
    decompress_rl_elist_impl(Nums).