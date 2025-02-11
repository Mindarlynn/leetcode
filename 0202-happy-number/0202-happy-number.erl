-spec is_happy(N :: integer()) -> boolean().

to_digits(0) -> [];
to_digits(N) ->
    to_digits(trunc(N / 10)) ++ [N rem 10].

is_happy(1, Set) -> true;
is_happy(N, Set) ->
    case sets:is_subset(sets:from_list([N]), Set) of
        true -> false;
        false -> 
            Digits = to_digits(N),
            Squared = [X * X || X <- Digits],
            Sum = lists:sum(Squared),
            is_happy(Sum, sets:add_element(N, Set))
    end.

is_happy(N) ->
    is_happy(N, sets:new()).