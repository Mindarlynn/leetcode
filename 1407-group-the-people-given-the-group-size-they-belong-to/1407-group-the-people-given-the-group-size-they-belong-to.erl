-spec group_the_people(GroupSizes :: [integer()]) -> [[integer()]].

count(L) -> count(L, 0, dict:new()).
count([], _, Dict) -> Dict;
count([X | Xs], Idx, Dict) ->
    L = case dict:is_key(X, Dict) of
        true -> dict:fetch(X, Dict);
        false -> []
    end,
    count(Xs, Idx + 1, dict:store(X, L ++ [Idx], Dict)).

partition([], _, Buffer) -> [Buffer];
partition([X | Xs], Size, Buffer) ->
    case length(Buffer) of
        Val when Val == Size -> [Buffer] ++ partition(Xs, Size, [X]);
        _ -> partition(Xs, Size, Buffer ++ [X])
    end.

iterate([], _) -> [];
iterate([X | Xs], Dict) ->
    partition(dict:fetch(X, Dict), X, []) ++ iterate(Xs, Dict).

distinct(X) -> sets:to_list(sets:from_list(X)).

group_the_people(GroupSizes) ->
    Dict = count(GroupSizes),
    iterate(distinct(GroupSizes), Dict). 