-spec min_partitions(N :: unicode:unicode_binary()) -> integer().

print(X) -> io:format("~p~n", [X]).

min_partitions(N) ->
  mp(binary_to_list(N), 0).

mp([], Max) -> Max;
mp([H | T], Max) ->
  mp(T, lists:max([Max, list_to_integer([H])])).
  