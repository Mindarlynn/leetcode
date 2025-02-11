-spec xor_operation(N :: integer(), Start :: integer()) -> integer().

seq(Start, N, Incr) -> seq(Start, N, Incr, 0, []).
seq(_, N, _, Len, Result) when Len =:= N -> Result;
seq(Cur, N, Incr, Len, Result) -> seq(Cur + Incr, N, Incr, Len + 1, Result ++ [Cur]).


xor_operation(N, Start) ->
    Seq = seq(Start, N, 2),
    lists:foldl(
        fun (X, Xor) ->
            Xor bxor X
        end, hd(Seq), tl(Seq) 
    ).