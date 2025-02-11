-spec largest_local(Grid :: [[integer()]]) -> [[integer()]].

get_area_max(Grid) -> lists:max(lists:flatten(Grid)).

slice_area(Grid, N) -> slice_area(Grid, N, 1, 1).
slice_area(Grid, N, X, Y) when Y =< (N - 2), X =< (N - 2) ->
    [get_area_max(lists:sublist([lists:sublist(SubList, X, 3) || SubList <- Grid], Y, 3))] ++ 
    slice_area(Grid, N, X + 1, Y);
slice_area(Grid, N, X, Y) when Y =< (N - 2) ->
    slice_area(Grid, N, 1, Y + 1);
slice_area(_, _, _, _) -> [].

to_n_dimensional_list(List, N) -> to_n_dimensional_list(List, N, 0, [], []).
to_n_dimensional_list([], N, Cur, List, NDList) -> NDList ++ [List];
to_n_dimensional_list(List, N, Cur, TmpList, NDList) when N =:= Cur ->
    to_n_dimensional_list(List, N, 0, [], NDList ++ [TmpList]);
to_n_dimensional_list([H | T], N, Cur, TmpList, NDList) ->
    to_n_dimensional_list(T, N, Cur + 1, TmpList ++ [H], NDList).

largest_local(Grid) ->
    N = length(Grid),
    to_n_dimensional_list(slice_area(Grid, N), N - 2).