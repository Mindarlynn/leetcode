max_profit(_, []) -> 0;
max_profit(Prev, [H | T]) ->
    max(H - Prev, 0) + max_profit(H, T).

-spec max_profit(Prices :: [integer()]) -> integer().
max_profit(Prices) ->
    max_profit(hd(Prices), tl(Prices)).