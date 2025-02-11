-spec climb_stairs(N :: integer()) -> integer().

climb_stairs(N, A, B) when N =< 0 -> A + B;
climb_stairs(N, A, B) -> climb_stairs(N - 1, B, A + B).

climb_stairs(N) ->
  case N of
    0 -> 0;
    1 -> 1;
    2 -> 2;
    _ -> climb_stairs(N - 2, 1, 1)
  end.