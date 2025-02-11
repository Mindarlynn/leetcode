-spec max_width_of_vertical_area(Points :: [[integer()]]) -> integer().

get_max_width(List) -> get_max_width(tl(List), hd(List), 0).
get_max_width([H | []], _, Max) -> Max;
get_max_width([H | T], Prev, Max) when H - Prev > Max -> get_max_width(T, H, H - Prev);
get_max_width([H | T], _, Max) -> get_max_width(T, H, Max).

max_width_of_vertical_area(Points) ->
    Xs = lists:sort(lists:map(fun hd/1, Points)),
    get_max_width(Xs).
    