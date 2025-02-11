-spec arrange_coins(N :: integer()) -> integer().

%1 3 6 10 15 21 28 35

arrange_coins(N) ->
    erlang:trunc(math:sqrt(N * 2 + 0.25) - 0.5).