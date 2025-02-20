-spec combine(N :: integer(), K :: integer()) -> [[integer()]].
combine(N, K) ->
    bcktrk(N, K, 1, 0, []).

bcktrk(_, K, _, K, Tmp) -> [Tmp];
bcktrk(N, K, S, Len, Tmp) ->
    lists:foldl(
        fun(X, Res) ->
            Res ++ bcktrk(N, K, X + 1, Len + 1, Tmp ++ [X])
        end, [], lists:seq(S, N)
    ).