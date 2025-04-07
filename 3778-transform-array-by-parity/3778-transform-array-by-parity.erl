-spec transform_array(Nums :: [integer()]) -> [integer()].
transform_array(Nums) ->
    {Even, Odd} = count(Nums, 0, 0),
    lists:duplicate(Even, 0) ++ lists:duplicate(Odd, 1).

count([], Even, Odd) -> {Even, Odd};
count([H | T], Even, Odd) when H rem 2 == 0 ->
    count(T, Even + 1, Odd);
count([H | T], Even, Odd) ->
    count(T, Even, Odd + 1).