-spec my_atoi(S :: unicode:unicode_binary()) -> integer().

sign([H | T]) when H =:= $- -> {-1, T};
sign([H | T]) when H =:= $+ -> {1, T};
sign(List) -> {1, List}.

first_number([]) -> [];
first_number([H | T]) when H >= $0, H =< $9 -> [H] ++ first_number(T);
first_number(_) -> [].

check_empty([]) -> [$0];
check_empty(List) -> List.

my_atoi(S) ->
    LS = binary_to_list(S),
    TRIMMED = string:trim(LS),
    {SIGN, REST} = sign(TRIMMED),
    NUM = first_number(REST),
    VALID_NUM = list_to_integer(check_empty(NUM)),
    min(max(SIGN * VALID_NUM, -2147483648), 2147483647).