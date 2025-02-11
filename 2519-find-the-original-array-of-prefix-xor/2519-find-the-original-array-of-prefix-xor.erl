-spec find_array(Pref :: [integer()]) -> [integer()].
find_array(Pref) ->
    fa(Pref).

fa(P) -> fa(P, 0).
fa([], _) -> [];
fa([P | Ps], Prev) ->
    [P bxor Prev] ++ fa(Ps, P).