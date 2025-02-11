-spec add_binary(A :: unicode:unicode_binary(), B :: unicode:unicode_binary()) -> unicode:unicode_binary().

add_binary(A, B) ->
    AA = binary_to_integer(A, 2),
    BB = binary_to_integer(B, 2),
    integer_to_binary(AA + BB, 2).