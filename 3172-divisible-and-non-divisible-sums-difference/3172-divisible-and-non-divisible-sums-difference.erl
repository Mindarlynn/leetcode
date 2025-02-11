-spec difference_of_sums(N :: integer(), M :: integer()) -> integer().
difference_of_sums(N, M) ->
    lists:sum(lists:map(fun (X) ->
        case X rem M of
            0 -> -X;
            _ -> X
        end
    end, lists:seq(1, N))).