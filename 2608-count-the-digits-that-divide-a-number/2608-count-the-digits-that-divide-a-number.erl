-spec count_digits(Num :: integer()) -> integer().
count_digits(Num) ->
    lists:foldl(
        fun (X, Cnt) ->
            Cnt + case Num rem X of
                0 -> 1;
                _ -> 0
            end
        end,
        0, [X - $0 || X <- integer_to_list(Num)]
    ).