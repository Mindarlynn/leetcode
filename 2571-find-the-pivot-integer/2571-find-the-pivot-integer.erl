-spec pivot_integer(N :: integer()) -> integer().

pivot_integer_impl(0, _, _) -> -1;
pivot_integer_impl(N, RightSum, RightSum) -> N;
pivot_integer_impl(N, RightSum, Total) ->
    pivot_integer_impl(N - 1, RightSum + N - 1, Total - N).

pivot_integer(N) ->
    pivot_integer_impl(N, N, N * (N + 1) div 2).