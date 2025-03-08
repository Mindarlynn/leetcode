-spec can_finish(NumCourses :: integer(), Prerequisites :: [[integer()]]) -> boolean().
can_finish(NumCourses, Prerequisites) ->
    G = build_graph(NumCourses, Prerequisites),
    Res = digraph_utils:is_acyclic(G),
    digraph:delete(G),
    Res.

build_graph(N, []) ->
    G = digraph:new(),
    lists:map(
        fun(X) -> digraph:add_vertex(G, X) end,
        lists:seq(0, N - 1)
    ),
    G;
build_graph(N, [[U, V] | T]) ->
    G = build_graph(N, T),
    digraph:add_edge(G, U, V),
    G.