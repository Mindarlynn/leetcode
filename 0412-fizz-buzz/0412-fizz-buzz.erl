-spec fizz_buzz(N :: integer()) -> [unicode:unicode_binary()].

fizz_buzz(N) when N == 0 -> [];
fizz_buzz(N) when N rem 3 == 0, N rem 5 == 0 -> fizz_buzz(N - 1) ++ [list_to_binary("FizzBuzz")];
fizz_buzz(N) when N rem 3 == 0 -> fizz_buzz(N - 1) ++ [list_to_binary("Fizz")];
fizz_buzz(N) when N rem 5 == 0 -> fizz_buzz(N - 1) ++ [list_to_binary("Buzz")];
fizz_buzz(N) -> fizz_buzz(N - 1) ++ [list_to_binary(integer_to_list(N))].