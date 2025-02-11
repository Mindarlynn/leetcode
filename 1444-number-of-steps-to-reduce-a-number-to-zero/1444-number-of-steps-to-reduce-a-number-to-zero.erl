-spec number_of_steps(Num :: integer()) -> integer().
number_of_steps(Num) when Num =:= 0 -> 0;
number_of_steps(Num) when Num rem 2 =:= 0 -> 1 + number_of_steps(Num div 2);
number_of_steps(Num) -> 1 + number_of_steps(Num - 1).