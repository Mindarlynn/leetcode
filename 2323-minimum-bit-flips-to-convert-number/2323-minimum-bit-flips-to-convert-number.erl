-spec min_bit_flips(Start :: integer(), Goal :: integer()) -> integer().

min_bit_flips_impl({Start, Goal}) -> min_bit_flips_impl(Start, Goal, 0).
min_bit_flips_impl([], _, Cnt) -> Cnt;
min_bit_flips_impl(_, [], Cnt) -> Cnt;
min_bit_flips_impl([H1 | T1], [H2 | T2], Cnt) when H1 =/= H2 -> min_bit_flips_impl(T1, T2, Cnt + 1);
min_bit_flips_impl([H1 | T1], [H2 | T2], Cnt) -> min_bit_flips_impl(T1, T2, Cnt).

adjust_length(L1, L2) -> adjust_length(L1, length(L1), L2, length(L2)).
adjust_length(L1, Len1, L2, Len2) when Len1 =:= Len2 -> {L1, L2};
adjust_length(L1, Len1, L2, Len2) when Len1 < Len2 -> adjust_length([$0] ++ L1, Len1 + 1, L2, Len2);
adjust_length(L1, Len1, L2, Len2) -> adjust_length(L1, Len1, [$0] ++ L2, Len2 + 1).

min_bit_flips(Start, Goal) ->
    {L1, L2} = {integer_to_list(Start, 2), integer_to_list(Goal, 2)},
    min_bit_flips_impl(adjust_length(L1, L2)).