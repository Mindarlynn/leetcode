-spec make_fancy_string(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

make([], _, _) -> [];
make([H | T], H, Cnt) ->
    case Cnt < 2 of    
        true -> [H];
        _ -> []
    end ++ make(T, H, Cnt + 1);
make([H | T], _, _) -> [H] ++ make(T, H, 1).

make_fancy_string(S) ->
    list_to_binary(make(binary_to_list(S), 0, 0)).