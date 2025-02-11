-spec string_hash(S :: unicode:unicode_binary(), K :: integer()) -> unicode:unicode_binary().

string_hash_impl(S, K, Acc, AccLen) when K =:= AccLen -> 
    [(Acc rem 26) + $a] ++ string_hash_impl(S, K, 0, 0);
string_hash_impl([], _, _, _) -> [];
string_hash_impl([H | T], K, Acc, AccLen) -> 
    string_hash_impl(T, K, Acc + H - $a, AccLen + 1).

string_hash(S, K) ->
    list_to_binary(string_hash_impl(binary_to_list(S), K, 0, 0)).