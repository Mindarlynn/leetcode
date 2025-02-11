-spec sort_the_students(Score :: [[integer()]], K :: integer()) -> [[integer()]].
sort_the_students(Score, K) ->
    lists:sort(
        fun (A, B) ->
            lists:nth(K + 1, A) > lists:nth(K + 1, B)
        end, Score
    ).