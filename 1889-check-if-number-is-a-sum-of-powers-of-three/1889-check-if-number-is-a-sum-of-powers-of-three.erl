-spec check_powers_of_three(N :: integer()) -> boolean().
check_powers_of_three(N) ->
    case N > 0 of
        true when N rem 3 == 2 -> false;
        true -> check_powers_of_three(N div 3);
        _ -> true
    end.