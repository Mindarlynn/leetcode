-spec apply_operations(Nums :: [integer()]) -> [integer()].
apply_operations(Nums) ->
    shr_zeros(apply(Nums)).


apply([]) -> [];
apply([H, H | T]) ->
    [2 * H] ++ apply([0 | T]);
apply([H | T]) ->
    [H] ++ apply(T).

shr_zeros(List) ->
    N = length(List),
    Left = [X || X <- List, X =/= 0],
    Left ++ lists:duplicate(N - length(Left), 0).