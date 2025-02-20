-spec combination_sum(Candidates :: [integer()], Target :: integer()) -> [[integer()]].
combination_sum(Candidates, Target) ->
    bcktrk(Candidates, Target, 0, 0, []).

bcktrk(_, Target, _, Sum, _) when Target < Sum -> [];
bcktrk(_, Target, _, Target, Tmp) -> [Tmp];
bcktrk(Candidates, Target, S, Sum, Tmp) ->
    element(2, lists:foldl(
        fun(X, {_S, Res}) ->
            {_S + 1, Res ++ bcktrk(Candidates, Target, _S, Sum + X, Tmp ++ [X])}
        end, {S, []}, element(2, lists:split(S, Candidates))
    )).