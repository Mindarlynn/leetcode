-spec subset_xor_sum(Nums :: [integer()]) -> integer().

xor_total([]) -> 0;
xor_total(List) -> xor_total(tl(List), hd(List)).
xor_total([], Total) -> Total;
xor_total([H | T], Total) -> xor_total(T, Total bxor H).

all_subseq(List) -> all_subseq(List, List, length(List), 0, [], []).
all_subseq(List, _, N, Cnt, Tmp, Result) when Cnt =:= N ->
    Result ++ [Tmp];
all_subseq(List, [H | T], N, Cnt, Tmp, Result) ->
    all_subseq(List, T, N, Cnt + 1, Tmp ++ [H], Result) ++ 
    all_subseq(List, T, N, Cnt + 1, Tmp, Result).

subset_xor_sum(Nums) ->
    lists:foldl(
        fun (X, Sum) ->
            Sum + xor_total(X)
        end, 
        0, all_subseq(Nums)).