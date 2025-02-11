-spec build_array(Nums :: [integer()]) -> [integer()].

build_array(Nums) ->
    lists:map(fun (E) ->
        lists:nth(E + 1, Nums)
    end, Nums).