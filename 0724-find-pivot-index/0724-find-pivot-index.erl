-spec pivot_index(Nums :: [integer()]) -> integer().

impl([], Left, Right, Cnt) -> -1;
impl([H | T], Left, Right, Cnt) when Left =:= Right - H -> Cnt;
impl([H | T], Left, Right, Cnt) -> impl(T, Left + H, Right - H, Cnt + 1).


pivot_index(Nums) ->
    impl(Nums, 0, lists:sum(Nums), 0).