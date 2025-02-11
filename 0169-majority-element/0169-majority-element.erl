-spec majority_element(Nums :: [integer()]) -> integer().

count([], Target, Count) -> Count;
count([H | T], Target, Count) ->
    case H == Target of
        true -> count(T, Target, Count + 1);
        false -> count(T, Target, Count)
    end.

majority_element(Nums) ->
    NonDup = sets:to_list(sets:from_list(Nums)),
    Counts = [{count(Nums, X, 0), X} || X <- NonDup],
    {Count, Num} = lists:max(Counts),
    Num.