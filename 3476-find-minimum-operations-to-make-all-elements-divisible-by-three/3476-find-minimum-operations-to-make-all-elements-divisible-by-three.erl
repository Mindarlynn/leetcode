-spec minimum_operations(Nums :: [integer()]) -> integer().
minimum_operations(Nums) ->
    lists:sum(lists:map(fun (X) ->
        case X rem 3 of
            0 -> 0;
            _ -> 1
        end
    end, Nums)).