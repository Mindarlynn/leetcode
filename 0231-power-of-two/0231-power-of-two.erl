-spec is_power_of_two(N :: integer()) -> boolean().
-import (math, [log2/1, floor/1]).

is_power_of_two(N) when N =< 0 ->
    false;
is_power_of_two(N) ->
    Real = log2(N),
    Exponent = floor(Real),
    Real =:= Exponent.
