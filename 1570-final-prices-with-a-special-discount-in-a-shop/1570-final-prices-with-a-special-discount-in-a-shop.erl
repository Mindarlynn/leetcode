-spec impl(Prices :: [integer()]) -> [integer()].
impl([]) -> [];
impl([H | T]) -> 
    case get_first_smaller(T, H) of
        -1 -> [H];
        Val -> [H - Val]
    end ++ impl(T).

-spec get_first_smaller(List :: [integer()], Cmp :: integer()) -> integer().
get_first_smaller([], _) -> -1;
get_first_smaller([H | T], Cmp) when H =< Cmp -> H;
get_first_smaller([H | T], Cmp) -> get_first_smaller(T, Cmp). 

-spec final_prices(Prices :: [integer()]) -> [integer()].
final_prices(Prices) ->
    impl(Prices).