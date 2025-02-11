impl([H | T], Mul) -> impl(T, [], H, [], Mul).

impl([], Left, Mid, Right, Mul) -> Left ++ [Mid * Mul] ++ Right;
impl([H | T], Left, Mid, Right, Mul) when H < Mid -> impl(T, Left ++ [Mid] ++ Right, H, [], Mul);
impl([H | T], Left, Mid, Right, Mul) -> impl(T, Left, Mid, Right ++ [H], Mul).

-spec get_final_state(Nums :: [integer()], K :: integer(), Multiplier :: integer()) -> [integer()].
get_final_state(Nums, K, Multiplier) ->
    LoopRes = impl(Nums, Multiplier),
    if
        K == 1 -> LoopRes;
        true -> get_final_state(LoopRes, K - 1, Multiplier)
    end.