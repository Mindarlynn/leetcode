-spec find_matrix(Nums :: [integer()]) -> [[integer()]].

find_matrix_impl(Nums) -> find_matrix_impl(Nums, [], sets:new(), []).
find_matrix_impl([], [], Set, Result) -> Result ++ [sets:to_list(Set)];
find_matrix_impl([], Rest, Set, Result) -> find_matrix_impl(Rest, [], sets:new(), Result ++ [sets:to_list(Set)]);
find_matrix_impl([H | T], Rest, Set, Result) ->
    case sets:is_element(H, Set) of
        true -> find_matrix_impl(T, Rest ++ [H], Set, Result);
        false -> find_matrix_impl(T, Rest, sets:add_element(H, Set), Result)
    end.


find_matrix(Nums) ->
    find_matrix_impl(Nums).