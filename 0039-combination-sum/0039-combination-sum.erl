-spec combination_sum(Candidates :: [integer()], Target :: integer()) -> [[integer()]].

sum(List, Target) -> sum(List, Target, [], []).
sum(_, Target, _, Acc) when Target < 0 -> Acc;
sum(_, Target, Cur, Acc) when Target == 0 -> [Cur | Acc];
sum([], Target, Cur, Acc) when Target > 0 -> Acc;
sum([H|T], Target, Cur, Acc) when Target > 0 ->
    sum(T, Target, Cur, sum([H|T], Target-H, [H|Cur], Acc)).

combination_sum(Candidates, Target) ->
    sum(Candidates, Target).