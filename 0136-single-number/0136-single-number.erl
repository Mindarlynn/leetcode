-spec single_number(Nums :: [integer()]) -> integer().

qs([]) -> [];
qs([X | Xs]) ->
    qs([Y || Y <- Xs, Y =< X]) ++ [X] ++ qs([Y || Y <- Xs, Y > X]).


count([H | T]) ->
    count(T, H, 1).
count([], Cur, Count) -> Cur;
count([H | T], Cur, Count) -> 
    case Count == 2 of
        true -> count(T, H, 1);
        false -> 
            case Cur == H of
                true -> count(T, Cur, Count + 1);
                false -> Cur
            end
    end.

single_number(Nums) ->
    Sorted = qs(Nums),
    count(Sorted).