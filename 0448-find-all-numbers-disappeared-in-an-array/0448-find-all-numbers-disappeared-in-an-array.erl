-spec find_disappeared_numbers(Nums :: [integer()]) -> [integer()].

count(List) ->
    count(List, dict:new()).
count([], Dict) -> Dict;
count([H | T], Dict) ->
    NewDict = case dict:is_key(H, Dict) of
        true -> Dict;
        false -> dict:append(H, 1, Dict)
    end,
    count(T, NewDict).

find(N, Dict) ->
    find(N, Dict, []).
find(N, Dict, List) when N == 0 -> List;
find(N, Dict, List) ->
    NewList = case dict:is_key(N, Dict) of
        true -> List;
        false -> List ++ [N]
    end,
    find(N - 1, Dict, NewList).

find_disappeared_numbers(Nums) ->
    find(length(Nums), count(Nums)).
