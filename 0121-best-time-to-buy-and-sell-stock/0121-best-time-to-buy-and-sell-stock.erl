-spec max_profit(Prices :: [integer()]) -> integer().
-spec max_profit(Prices :: [integer()], Min :: integer(), Max :: integer(), Profits :: [integer()]) -> integer().

max_profit([], Min, Max, Profits) -> lists:max(Profits);
max_profit([H | T], Min, Max, Profits) ->
    case H < Min of
        true -> max_profit(T, H, H, Profits);
        false -> 
            case H > Max of
                true -> max_profit(T, Min, H, Profits ++ [H - Min]);
                false -> max_profit(T, Min, Max, Profits)
            end
    end.
    

max_profit(Prices) ->
  max_profit(Prices, 99999, 0, [0]).