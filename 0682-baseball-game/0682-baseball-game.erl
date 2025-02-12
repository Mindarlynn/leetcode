helper([], Rec) -> lists:sum(Rec);
helper([[$+] | T], Rec) -> helper(T, [hd(Rec) + hd(tl(Rec))] ++ Rec);
helper([[$D] | T], Rec) -> helper(T, [hd(Rec) * 2] ++ Rec);
helper([[$C] | T], [_ | TRec]) -> helper(T, TRec);
helper([H | T], Rec) -> helper(T, [list_to_integer(H)] ++ Rec).

-spec cal_points(Operations :: [unicode:unicode_binary()]) -> integer().
cal_points(Operations) ->
    helper(lists:map(fun binary_to_list/1, Operations), []).