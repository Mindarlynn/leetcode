-spec reverse_degree(S :: unicode:unicode_binary()) -> integer().
reverse_degree(<<S/binary>>) -> reverse_degree(lists:reverse(binary_to_list(S)));
reverse_degree([]) -> 0;
reverse_degree([H | T]) ->
    (26 - H + $a) * (length(T) + 1) + reverse_degree(T).