-spec hamming_weight(N :: integer()) -> integer().

count([], Count) -> Count;
count([H | T], Count) when [H] == "1" -> count(T, Count + 1);
count([H | T], Count) -> count(T, Count).

hamming_weight(N) ->
  count(binary_to_list(integer_to_binary(N, 2)), 0).