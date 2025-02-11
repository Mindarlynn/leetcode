-spec is_power_of_four(N :: integer()) -> boolean().

round(Number, Precision) ->
    Power = math:pow(10, Precision),
    round(Number * Power) / Power.

is_power_of_four(N) when N =< 0 -> false;
is_power_of_four(N) ->
    Real = round(math:log(N) / math:log(4), 14),
    Exponent = math:floor(Real),
    Real == Exponent.