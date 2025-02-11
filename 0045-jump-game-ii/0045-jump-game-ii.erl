-spec jump(Nums :: [integer()]) -> integer().

jump([], Jumps, _, _) -> Jumps;
jump([_T], Jumps, _, _) -> Jumps;
jump([H|T], Jumps, Current_jump_end, Farthest) ->
    NewFarthest = lists:max([Farthest, H]),
    case Current_jump_end == 0 of
        true ->  jump(T, Jumps + 1, NewFarthest - 1, NewFarthest - 1);
        false -> jump(T, Jumps, Current_jump_end - 1, NewFarthest - 1)
    end.

jump(Nums) ->
  jump(Nums, 0, 0, 0).