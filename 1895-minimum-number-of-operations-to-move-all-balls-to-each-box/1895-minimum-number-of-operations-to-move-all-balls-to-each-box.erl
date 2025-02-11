-spec min_operations(Boxes :: unicode:unicode_binary()) -> [integer()].


min_operations_impl(List) -> min_operations_impl(List, [], []).
min_operations_impl([], _, Moves) -> Moves;
min_operations_impl([{HIdx, H} | T], FrontList, Moves)-> 
    min_operations_impl(
        T, FrontList ++ [{HIdx, H}], 
        Moves ++ [lists:foldl(
            fun ({Idx, Val}, Sum) ->
                case Val of
                    $0 -> Sum;
                    $1 -> Sum + abs(HIdx - Idx)
                end
            end, 0, FrontList ++ T
        )]
    ).

min_operations(Boxes) ->
    min_operations_impl(lists:enumerate(binary_to_list(Boxes))).