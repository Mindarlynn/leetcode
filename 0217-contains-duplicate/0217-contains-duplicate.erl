-spec contains_duplicate(Nums :: [integer()]) -> boolean().


contains_duplicate(Nums) ->
  not (lists:usort(Nums) == lists:sort(Nums)).