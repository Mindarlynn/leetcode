btoi(true) -> 1;
btoi(false) -> 0.

impl([], _, _) -> 0;
impl([H | T], Left, Right) -> btoi((Left - Right) rem 2 =:= 0) + impl(T, Left + H, Right - H).

-spec count_partitions(Nums :: [integer()]) -> integer().
count_partitions(Nums) ->
    impl(tl(Nums), hd(Nums), lists:sum(Nums) - hd(Nums)).