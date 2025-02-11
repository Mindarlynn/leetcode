-spec compressed_string(Word :: unicode:unicode_binary()) -> unicode:unicode_binary().

compress(Word) -> compress(Word, hd(Word), 0).
compress([], Cur, Cnt) -> [integer_to_list(Cnt), Cur];
compress([H | T], Cur, Cnt) when Cnt =:= 9 -> 
    [integer_to_list(Cnt), Cur] ++ compress(T, H, 1);
compress([H | T], Cur, Cnt) when H =:= Cur -> 
    compress(T, Cur, Cnt + 1);
compress([H | T], Cur, Cnt) -> 
    [integer_to_list(Cnt), Cur] ++ compress(T, H, 1).
    

compressed_string(Word) ->
    list_to_binary(compress(binary_to_list(Word))).