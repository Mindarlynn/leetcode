-spec is_power_of_three(N :: integer()) -> boolean().

round(Number, Precision) ->
    Power = math:pow(10, Precision),
    round(Number * Power) / Power.

is_power_of_three(N) when N =< 0 -> false;
is_power_of_three(N) ->
    Real = round(math:log(N) / math:log(3), 14),
    Exponent = math:floor(Real),
    io:format("~p~n", [Real]),
    io:format("~p~n", [Exponent]),
    Real == Exponent.