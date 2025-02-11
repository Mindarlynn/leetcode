-spec final_value_after_operations(Operations :: [unicode:unicode_binary()]) -> integer().

eval([H | _], [H_R | _]) when H =:= $+; H_R =:= $+ -> +1;
eval(_, _) -> -1.

final_value_after_operations([]) -> 0;
final_value_after_operations([H | T]) ->
    S = binary_to_list(H),
    S_R = lists:reverse(S),
    eval(S, S_R) + final_value_after_operations(T).