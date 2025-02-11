-spec stable_mountains(Height :: [integer()], Threshold :: integer()) -> [integer()].

stable_mountains_impl(Height, Threshold) -> stable_mountains_impl(lists:enumerate(tl(Height)), hd(Height), Threshold, []).
stable_mountains_impl([], _, _, Res) -> Res;
stable_mountains_impl([{Idx, H} | T], Prev, Threshold, Res) when Prev > Threshold ->
    stable_mountains_impl(T, H, Threshold, Res ++ [Idx]);
stable_mountains_impl([{_, H} | T], _, Threshold, Res) ->
    stable_mountains_impl(T, H, Threshold, Res).
    

stable_mountains(Height, Threshold) ->
    stable_mountains_impl(Height, Threshold).