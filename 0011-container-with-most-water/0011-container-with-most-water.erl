-spec max_area(Height :: [integer()]) -> integer().

min(X, Y) when X =< Y -> X;
min(X, Y) when X > Y -> Y.
max(X, Y) when X =< Y -> Y;
max(X, Y) when X > Y -> X.
    
max_area(L1, L2, I, J, Max) when (J =< I) -> Max;
max_area(L1, L2, I, J, Max) ->
    [H | Rest1] = L1,
    [T | Rest2] = L2,
    Size = max(Max, (J - I) * min(H, T)),

    case H =< T of
        true -> max_area(Rest1, L2, I + 1, J, Size);
        false -> max_area(L1, Rest2, I, J - 1, Size)
    end.

max_area(Height) ->
  max_area(Height, lists:reverse(Height), 1, length(Height), 0).