-spec can_measure_water(X :: integer(), Y :: integer(), Target :: integer()) -> boolean().
can_measure_water(X, Y, Target) ->
    if 
        Target > X + Y -> false;
        true -> (Target rem gcd(X, Y)) =:= 0
    end.

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).