-spec search_insert(Nums :: [integer()], Target :: integer()) -> integer().

can([], Target, Index) -> Index;
can([H | T], Target, Index) ->
    case Target =< H of
        true -> Index;
        false -> can(T, Target, Index + 1)
    end.

search_insert(Nums, Target) ->
  can(Nums, Target, 0).