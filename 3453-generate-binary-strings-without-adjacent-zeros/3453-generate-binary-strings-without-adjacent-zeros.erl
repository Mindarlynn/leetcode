-spec valid_strings(N :: integer()) -> [unicode:unicode_binary()].

create(N) ->
    create(N, 0, 0, 1, [], []) ++
    create(N, 0, 1, 0, [], []).
create(N, Cnt, Cur, Prev, Tmp, Result) when N =:= Cnt -> [Tmp];
create(N, Cnt, Cur, Prev, Tmp, Result) when Cur =:= 0, Cur =:= Prev -> [];
create(N, Cnt, Cur, Prev, Tmp, Result) ->
    create(N, Cnt + 1, 0, Cur, Tmp ++ [Cur], Result) ++
    create(N, Cnt + 1, 1, Cur, Tmp ++ [Cur], Result).

valid_strings(N) ->
    lists:map(
        fun (E) ->
            list_to_binary([X + $0 || X <- E])
        end,
        sets:to_list(sets:from_list(create(N)))
    ).