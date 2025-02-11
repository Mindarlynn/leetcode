-spec truncate_sentence(S :: unicode:unicode_binary(), K :: integer()) -> unicode:unicode_binary().

%% white space ascii : 32

trunk_word_after_k(List, K) -> trunk_word_after_k(List, K, 0, []).
trunk_word_after_k([], _, _, Result) -> Result;
trunk_word_after_k([H | T], K, Cnt, Result) when (K - 1) =:= Cnt, H =:= 32 -> Result;
trunk_word_after_k([H | T], K, Cnt, Result) ->
    trunk_word_after_k(
        T, K, 
        Cnt + case H of
                32 -> 1;
                _ -> 0
            end,
        Result ++ [H]
    ).

truncate_sentence(S, K) ->
    list_to_binary(trunk_word_after_k(binary_to_list(S), K)).