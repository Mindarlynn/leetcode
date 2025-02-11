-spec impl(Nums :: [integer()], XorAcc :: integer(), MaximumBit :: integer()) -> [integer()].
impl([], _, _) -> [];
impl([H | T], XorAcc, MaximumBit) ->
    [XorAcc bxor ((1 bsl MaximumBit) - 1)] ++ impl(T, XorAcc bxor H, MaximumBit).

-spec get_maximum_xor(Nums :: [integer()], MaximumBit :: integer()) -> [integer()].
get_maximum_xor(Nums, MaximumBit) ->
    XorAcc = lists:foldl(
        fun (X, Acc) ->
            Acc bxor X
        end, 0, Nums
    ),
    impl(lists:reverse(Nums), XorAcc, MaximumBit).