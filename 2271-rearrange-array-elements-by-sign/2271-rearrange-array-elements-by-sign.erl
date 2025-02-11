-spec rearrange_array(Nums :: [integer()]) -> [integer()].

rearrange_array_impl([], []) -> [];
rearrange_array_impl([HPOS | TPOS], [HNEG | TNEG]) -> 
    [HPOS, HNEG] ++ rearrange_array_impl(TPOS, TNEG).

rearrange_array(Nums) ->
    Positive = [X || X <- Nums, X > 0],
    Negative = [X || X <- Nums, X < 0],
    % Rearrange
    rearrange_array_impl(Positive, Negative).
    