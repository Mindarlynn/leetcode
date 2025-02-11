-spec reverse(X :: integer()) -> integer().

to_digits(0) -> [0];
to_digits(N) ->
    to_digits(N, []).
to_digits(0, List) -> List;
to_digits(N, List) ->
    to_digits(N div 10, List ++ [N rem 10]).

to_int([]) -> 0;
to_int(List) ->
    to_int(List, 1, 0).
to_int([], TenSqr, Val) -> Val;
to_int([H | T], TenSqr, Val) ->
    to_int(T, TenSqr * 10, Val + H * TenSqr).

reverse(X) ->
    Reversed = case X < 0 of
        true -> -to_int(lists:reverse(to_digits(-X)));
        false -> to_int(lists:reverse(to_digits(X)))
    end,

    case (Reversed < -2.147483648e9) or (Reversed > 2.147483648e9 - 1) of
        true -> 0;
        false -> Reversed
    end.
  