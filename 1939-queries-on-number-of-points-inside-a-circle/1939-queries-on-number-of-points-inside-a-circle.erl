-spec count_points(Points :: [[integer()]], Queries :: [[integer()]]) -> [integer()].

dist([X1 | [Y1 | R1]], [X2 | [Y2 | []]]) -> {hd(R1), math:sqrt(math:pow(X1-X2, 2) + math:pow(Y1-Y2, 2))}.

count_points(Points, Queries) ->
    lists:map(
        fun (Y) ->
            lists:foldl(
                fun (X, Cnt) ->
                    {R1, Dist} = dist(Y, X),
                    case R1 < Dist of
                        true -> Cnt;
                        false -> Cnt + 1
                    end
                end,
                0, Points
            )
        end, Queries
    ).