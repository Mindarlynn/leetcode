-spec str_str(Haystack :: unicode:unicode_binary(), Needle :: unicode:unicode_binary()) -> integer().

check([], []) -> true;
check([H1 | T1], []) -> true;
check([], [H2 | T2]) -> false;
check([H1 | T1], [H2 | T2]) ->
    case H1 == H2 of
        true -> check(T1, T2);
        false -> false
    end.

str_str([], _, Idx) -> -1;
str_str(_, [], Idx) -> -1;
str_str([H1 | T1], [H2 | T2], Idx) ->
    case H1 == H2 of
        true -> 
            case check(T1, T2) of
                true -> Idx;
                false -> str_str(T1, [H2 | T2], Idx + 1)
            end;
        false -> str_str(T1, [H2 | T2], Idx + 1)
    end.

str_str(Haystack, Needle) ->
    str_str(binary_to_list(Haystack), binary_to_list(Needle), 0).