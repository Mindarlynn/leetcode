-spec multiply(Num1 :: unicode:unicode_binary(), Num2 :: unicode:unicode_binary()) -> unicode:unicode_binary().
multiply(Num1, Num2) ->
  integer_to_binary(binary_to_integer(Num1) * binary_to_integer(Num2)).