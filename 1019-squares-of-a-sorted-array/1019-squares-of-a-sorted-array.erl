helper([{Idx, H} | _], [{Idx, H} | _]) -> [H * H];
helper([{FIdx, FVal} | FT], [{RIdx, RVal} | RT]) ->
    case abs(FVal) < abs(RVal) of
        true -> helper([{FIdx, FVal} | FT], RT) ++ [RVal * RVal];
        _ -> helper(FT, [{RIdx, RVal} | RT]) ++ [FVal * FVal]
    end.
    

-spec sorted_squares(Nums :: [integer()]) -> [integer()].
sorted_squares(Nums) ->
    Indexed = lists:zip(lists:seq(1, length(Nums)), Nums),
    helper(Indexed, lists:reverse(Indexed)).