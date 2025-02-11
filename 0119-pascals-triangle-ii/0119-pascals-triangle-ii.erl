-spec get_row(RowIndex :: integer()) -> [integer()].

get_impl_add_element([], _, List) -> List;
get_impl_add_element([H | T], Prev, List) -> 
    get_impl_add_element(T, H, List ++ [H + Prev]). 

get_impl(RowIndex) when RowIndex =:= 0 -> [1];
get_impl(RowIndex) ->
    Prev = get_impl(RowIndex - 1),
    get_impl_add_element(tl(Prev), hd(Prev), [1]) ++ [1].

get_row(RowIndex) ->
    get_impl(RowIndex).