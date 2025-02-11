-spec add_digits(Num :: integer()) -> integer().


add_digits(0, Val) -> Val;
add_digits(Num, Val)->
    add_digits(Num div 10, Val + Num rem 10).

add_digits(Num) when Num < 10 -> Num;
add_digits(Num) ->
  add_digits(add_digits(Num, 0)).