-spec detect_capital_use(W :: unicode:unicode_binary()) -> boolean().

count([]) -> [];
count([W | Ws]) when W >= $A, W =< $Z -> [0] ++ count(Ws);
count([W | Ws]) -> [1] ++ count(Ws).

count(L, E) -> length([X || X <- L, X == E]) == length(L).

detect_capital_use(W) ->
    Word = binary_to_list(W),
    Len = length(Word),
    CL = count(Word),

    case {count(CL, 0), count(CL, 1)} of
        {true, _} -> true;
        {_, true} -> true;
        {_, _} -> 
            case hd(CL) == 0 of
                false -> false;
                true -> 
                    case {count(tl(CL), 0), count(tl(CL), 1)} of
                        {true, _} -> true;
                        {_, true} -> true;
                        {_, _} -> false
                    end
            end
    end. 