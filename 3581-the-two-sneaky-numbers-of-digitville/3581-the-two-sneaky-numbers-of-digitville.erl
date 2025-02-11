-spec get_sneaky_numbers(Nums :: [integer()]) -> [integer()].

get_sneaky_numbers_impl([], _) -> [];
get_sneaky_numbers_impl([H | T], Map) ->
    case maps:is_key(H, Map) of
        true -> [H] ++ get_sneaky_numbers_impl(T, Map);
        false -> get_sneaky_numbers_impl(T, maps:put(H, 0, Map))
    end.

get_sneaky_numbers(Nums) ->
    get_sneaky_numbers_impl(Nums, maps:new()).