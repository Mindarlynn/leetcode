-spec all_paths_source_target(Graph :: [[integer()]]) -> [[integer()]].
all_paths_source_target(Graph) ->
    dfs(Graph, length(Graph), 1, []).

dfs(_    , N, N, Path) -> [Path ++ [N - 1]];
dfs(Graph, N, I, Path) ->
    NextPath = Path ++ [I - 1],
    lists:foldl(
        fun(X, Res) ->
            Res ++ dfs(Graph, N, X + 1, NextPath)
        end, [], lists:nth(I, Graph)
    ).
    