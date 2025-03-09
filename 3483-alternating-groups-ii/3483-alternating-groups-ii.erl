-spec number_of_alternating_groups(_Colors :: [integer()], K :: integer()) -> integer().
number_of_alternating_groups(_Colors, K) ->
    Colors = lists:append(_Colors, _Colors),
    alt(Colors, K, length(_Colors) + K - 1, 1, 2).

alt(_     , _, N, _   , Right) when N < Right -> 0;
alt([R1, R2 | T], K, N, Left, Right) ->
    NewLeft = if
        R1 == R2 -> Right;
        true -> Left
    end,
    if
        (Right - NewLeft + 1) >= K -> 1;
        true -> 0
    end + alt([R2 | T], K, N, NewLeft, Right + 1).
        