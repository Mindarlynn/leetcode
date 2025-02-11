check(_, []) -> true;
check([H1 | T1], [H2 | T2]) when H1 =:= H2 -> check(T1, T2);
check(_, _) -> false.

-spec prefix_count(Words :: [unicode:unicode_binary()], Pref :: unicode:unicode_binary()) -> integer().
prefix_count(Words, Pref) ->
    lists:sum(
        lists:map(
            fun (Str) ->
                case check(binary_to_list(Str), binary_to_list(Pref)) of
                    true -> 1;
                    false -> 0
                end
            end, Words
        )
    ).