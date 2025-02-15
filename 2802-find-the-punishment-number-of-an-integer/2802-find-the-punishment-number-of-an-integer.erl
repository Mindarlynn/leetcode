is_partitionable(N) -> is_partitionable(N * N, N).
is_partitionable(N, T) when (T < 0) or (N < T) -> false;
is_partitionable(N, N) -> true;
is_partitionable(N, T) ->
    is_partitionable(N div 10, T - N rem 10) or
    is_partitionable(N div 100, T - N rem 100) or
    is_partitionable(N div 1000, T - N rem 1000).
    

-spec punishment_number(N :: integer()) -> integer().
punishment_number(0) -> 0;
punishment_number(N) ->
    case is_partitionable(N) of
        true -> N * N;
        _ -> 0
    end + punishment_number(N - 1).