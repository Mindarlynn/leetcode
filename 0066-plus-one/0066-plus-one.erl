-spec plus_one(Digits :: [integer()]) -> [integer()].

to_num(List) -> to_num(List, 0).
to_num([], Val) -> Val;
to_num([H | T], Val) -> to_num(T, Val * 10 + H).

plus_one(Digits) ->
    Num = to_num(Digits) + 1,
    io:format("~p~n", [Num]),
    [X - $0 || X <- integer_to_list(Num)].