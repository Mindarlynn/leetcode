-spec subtract_product_and_sum(N :: integer()) -> integer().

get_digit_list(N) -> lists:map(fun (X) -> X-$0 end, integer_to_list(N)).
mul_list(L) -> mul_list(L, 1).
mul_list([], Result) -> Result;
mul_list([H | T], Result) -> mul_list(T, Result * H).

subtract_product_and_sum(N) ->
    DigitList = get_digit_list(N),
    mul_list(DigitList) - lists:sum(DigitList).