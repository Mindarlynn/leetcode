-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].

two_sum(Nums, Target) ->
  N = lists:zip(lists:seq(0, length(Nums) - 1), Nums),
  R = [[Xi, Yi] || {Xi, X} <- N, {Yi, Y} <- N -- [{Xi, X}], X + Y =:= Target],
  hd(R).
  