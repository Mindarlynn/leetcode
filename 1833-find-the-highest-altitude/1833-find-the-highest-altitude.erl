-spec largest_altitude(Gain :: [integer()]) -> integer().

largest_altitude(Gain) ->
    {List, _} = 
        lists:foldl(
            fun (X, {Arr, Acc}) ->
                Acc2 = Acc + X,
                {Arr ++ [Acc2], Acc2}
            end, {[0], 0}, Gain
        ),
    lists:max(List).