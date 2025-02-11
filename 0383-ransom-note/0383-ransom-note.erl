-spec can_construct(RnansomNote :: unicode:unicode_binary(), Magazine :: unicode:unicode_binary()) -> boolean().

real_can_construct([], _) -> true;
real_can_construct([R | Rs], Magazine) ->
    case lists:member(R, Magazine) of
        true -> real_can_construct(Rs, Magazine -- [R]);
        false -> false
    end.   

can_construct(RansomNote, Magazine) -> 
    real_can_construct(binary_to_list(RansomNote), binary_to_list(Magazine)).