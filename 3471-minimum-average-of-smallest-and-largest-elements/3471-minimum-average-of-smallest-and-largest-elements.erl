-spec minimum_average(Nums :: [integer()]) -> float().

minimum_average_impl(N, {_, _}) when N =:= 0 -> [];
minimum_average_impl(N, {[H1 | T1], [H2 | T2]}) -> 
    [(H1 + H2) / 2] ++ minimum_average_impl(N - 1, {T1, T2}).
 
minimum_average(Nums) ->
    Ndiv2 = length(Nums) div 2,
    {MinList, MaxList} = lists:split(Ndiv2, lists:sort(Nums)),
    lists:min(minimum_average_impl(Ndiv2, {MinList, lists:reverse(MaxList)})).