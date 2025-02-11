-spec pivot_array(Nums :: [integer()], Pivot :: integer()) -> [integer()].
pivot_array(Nums, Pivot) ->
    [X || X <- Nums, X < Pivot] ++ [X || X <- Nums, X =:= Pivot] ++ [X || X <- Nums, X > Pivot].