-spec sum_of_the_digits_of_harshad_number(X :: integer()) -> integer().
sum_of_the_digits_of_harshad_number(X) ->
    Sum = lists:sum([X - $0 || X <- integer_to_list(X)]),
    case X rem Sum of
        0 -> Sum;
        _ -> -1
    end.