-spec find_content_children(G :: [integer()], S :: [integer()]) -> integer().

find_content_children(G, S) ->
    find(lists:reverse(lists:sort(G)), lists:reverse(lists:sort(S))).

find(G, S) -> find(G, S, 0).
find([], _, Count) -> Count;
find(_, [], Count) -> Count;
find([G | Gs], [S | Ss], Count) ->
    if
        G =< S -> find(Gs, Ss, Count + 1);
        true -> find(Gs, [S | Ss], Count)
    end.