-spec search_range(Nums :: [integer()], Target :: integer()) -> [integer()].

search([], Target, First, Last) -> [First, Last];
search([H|T], Target, First, Last) ->
    {Xi, X} = H,
    case X == Target of
        false -> search(T, Target, First, Last);
        true ->
            case First == -1 of
                true -> search(T, Target, Xi, Xi);
                false -> search(T, Target, First, Xi)
            end
    end.

search_range(Nums, Target) ->
    L = lists:zip(lists:seq(0, length(Nums) - 1), Nums),
    search(L, Target, -1, -1).