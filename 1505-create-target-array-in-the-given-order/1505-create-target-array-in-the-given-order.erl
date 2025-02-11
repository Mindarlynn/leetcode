-spec create_target_array(Nums :: [integer()], Index :: [integer()]) -> [integer()].

insert(Num, Target, List) -> insert(List, Num, Target, 0, []).
insert(List, Num, Target, Idx, Result) when Idx =:= Target -> Result ++ [Num] ++ List;
insert([H | T], Num, Target, Idx, Result) -> insert(T, Num, Target, Idx + 1, Result ++ [H]).

create_target_array_impl(Nums, Index) -> create_target_array_impl(Nums, Index, []).
create_target_array_impl([], _, Result) -> Result;
create_target_array_impl(_, [], Result) -> Result;
create_target_array_impl([H1 | T1], [H2 | T2], Result) -> create_target_array_impl(T1, T2, insert(H1, H2, Result)).

create_target_array(Nums, Index) ->
    create_target_array_impl(Nums, Index).