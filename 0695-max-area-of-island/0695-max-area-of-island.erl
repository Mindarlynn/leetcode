-spec max_area_of_island(Grid :: [[integer()]]) -> integer().
max_area_of_island(Grid) ->
    N = length(Grid),
    M = length(hd(Grid)),
    element(2, lists:foldl(
        fun({X, Y}, {Vis, Res}) ->
            case {sets:is_element({X, Y}, Vis), lists:nth(X, lists:nth(Y, Grid))} of
                {false, 1} -> 
                    {NewVis, Area} = dfs(Grid, sets:add_element({X, Y}, Vis), N, M, X, Y),
                    {NewVis, max(Res, Area)};
                _ -> {Vis, Res}
            end        
        end, {sets:new(), 0}, [{X, Y} || Y <- lists:seq(1, N), X <- lists:seq(1, M)]
    )).

dfs(G, Vis, N, M, X, Y) ->
    lists:foldl(
        fun({_X, _Y}, {Vis, Area}) ->
            DX = X + _X,
            DY = Y + _Y,
            case {sets:is_element({DX, DY}, Vis), DX =< 0, DX > M, DY =< 0, DY > N} of
                {false, false, false, false, false} ->
                    case lists:nth(DX, lists:nth(DY, G)) of
                        0 -> {Vis, Area};
                        1 ->
                            {NewVis, Add} = dfs(G, sets:add_element({DX, DY}, Vis), N, M, DX, DY),
                            {NewVis, Area + Add}
                    end;
                _ -> {Vis, Area}
            end
        end, {Vis, 1}, [{1, 0}, {0, 1}, {-1, 0}, {0, -1}]
    ).