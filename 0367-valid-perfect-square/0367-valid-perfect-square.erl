-spec is_perfect_square(Num :: integer()) -> boolean().
is_perfect_square(Num) ->
    Real = math:sqrt(Num),
    Exponent = math:floor(Real),
    Real == Exponent.