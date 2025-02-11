-spec num_jewels_in_stones(Jewels :: unicode:unicode_binary(), Stones :: unicode:unicode_binary()) -> integer().
num_jewels_in_stones_impl(_, []) -> 0;
num_jewels_in_stones_impl(Jewels, [H | T]) ->
    length([X || X <- Jewels, X =:= H]) + num_jewels_in_stones_impl(Jewels, T). 

num_jewels_in_stones(Jewels, Stones) ->
    num_jewels_in_stones_impl(
        binary_to_list(Jewels),
        binary_to_list(Stones)
    ).