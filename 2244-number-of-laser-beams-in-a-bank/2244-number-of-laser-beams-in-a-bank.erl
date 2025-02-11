-spec number_of_beams(Bank :: [unicode:unicode_binary()]) -> integer().

unbinarize(Bank) -> lists:map(fun binary_to_list/1, Bank).
count_laser(List) -> length([X || X <- List, X =:= $1]).

number_of_beams_impl(UBank) -> number_of_beams_impl(UBank, 0).
%% number_of_beams_impl(UBank, PrevLaserCount) -> 
number_of_beams_impl([], _) -> 0;
number_of_beams_impl([Row | T], PrevLaserCount) -> 
    CurCount = count_laser(Row),
    PrevLaserCount * CurCount + 
    number_of_beams_impl(T, 
        case CurCount of
            0 -> PrevLaserCount;
            _ -> CurCount
        end
    ).

number_of_beams(Bank) ->
    number_of_beams_impl(unbinarize(Bank)).