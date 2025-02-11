-spec impl(Nums :: [integer()], Left :: integer(), Right :: integer()) -> integer().
%% base case
impl([], _, _) -> 0;

impl([H | T], Left, Right) ->
    case Left >= Right of
        true -> 1;
        false -> 0
    end + impl(T, Left + H, Right - H).
    

-spec ways_to_split_array(Nums :: [integer()]) -> integer().
ways_to_split_array(Nums) ->
    impl(tl(Nums), hd(Nums), lists:sum(Nums) - hd(Nums)).