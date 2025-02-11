-spec construct_rectangle(Area :: integer()) -> [integer()].

construct(Area, L) ->
    Div = Area / L,
    T_Div = trunc(Div),
    case Div == T_Div of
        true -> lists:reverse(lists:sort([L, T_Div]));
        false -> construct(Area, L + 1)
    end.

construct_rectangle(Area) ->
    construct(Area, trunc(math:sqrt(Area))).