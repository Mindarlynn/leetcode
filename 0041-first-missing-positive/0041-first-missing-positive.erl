-spec first_missing_positive(Nums :: [integer()]) -> integer().

list_to_dict(List) ->
    list_to_dict(List, dict:new()).
list_to_dict([], Dict) -> Dict;
list_to_dict([H|T], Dict) ->
    list_to_dict(T, dict:append(H, 0, Dict)).

get_first_mp(Dict) ->
    get_first_mp(Dict, 1).
get_first_mp(Dict, Number) ->
    case dict:find(Number, Dict) of
        error -> Number;
        {ok, _} -> get_first_mp(Dict, Number + 1)
    end.

first_missing_positive(Nums) ->
    get_first_mp(list_to_dict(Nums)).