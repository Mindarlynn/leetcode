-spec min_moves_to_seat(Seats :: [integer()], Students :: [integer()]) -> integer().

sub_elements([], _, List) -> List;
sub_elements(_, [], List) -> List;
sub_elements([H1 | T1], [H2 | T2], List) -> sub_elements(T1, T2, List ++ [abs(H1 - H2)]).

min_moves_to_seat(Seats, Students) ->
    {S1, S2} = {lists:sort(Seats), lists:sort(Students)},
    lists:sum(sub_elements(S1, S2, [])).