-spec left_right_difference(Nums :: [integer()]) -> [integer()].

left_sum(Nums) -> left_sum(Nums, 0, [0]).
left_sum([_ | []], _, Result) -> Result;
left_sum([H | T], Prev, Result) -> left_sum(T, Prev + H, Result ++ [Prev + H]).

list_diff(L1, L2) -> list_diff(L1, L2, []).
list_diff([], _, Result) -> Result;
list_diff(_, [], Result) -> Result;
list_diff([H1 | T1], [H2 | T2], Result) -> list_diff(T1, T2, Result ++ [abs(H1 - H2)]).


left_right_difference(Nums) ->
    list_diff(
        left_sum(Nums),
        lists:reverse(left_sum(lists:reverse(Nums)))
    ).