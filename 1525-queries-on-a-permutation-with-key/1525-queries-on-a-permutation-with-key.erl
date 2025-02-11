-spec process_queries(Queries :: [integer()], M :: integer()) -> [integer()].

pick(List, Val) -> pick(List, Val, [], 0).
pick([H | T], H, Left, Len) -> { Len, [H] ++ Left ++ T };
pick([H | T], Val, Left, Len) -> pick(T, Val, Left ++ [H], Len + 1).
    
impl([], _) -> [];
impl([H | T], P) -> 
    {Res, NewP} = pick(P, H),
    [Res] ++ impl(T, NewP).

process_queries(Queries, M) ->
    P = lists:seq(1, M),
    impl(Queries, P).
    