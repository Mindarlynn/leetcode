-spec get_happy_string(N :: integer(), K :: integer()) -> unicode:unicode_binary().
get_happy_string(N, K) ->
    list_to_binary(element(2, bcktrack(N, K, 0, 1, -1, []))).

bcktrack(N, K, N, K, _, Res) -> {K + 1, Res};
bcktrack(N, K, N, Th, _, Res) -> 
    {Th + if Th < K -> 1; true -> 0 end, []};
bcktrack(N, K, Len, Th, Prev, Res) ->
    lists:foldl(
        fun(Ch, {_Th, _Res}) ->
            if
                (Ch == Prev) or (_Th > K) -> {_Th, _Res};
                true -> 
                    {__Th, __Res} = bcktrack(N, K, Len + 1, _Th, Ch, Res ++ [Ch]),
                    {__Th, case length(__Res) of
                        0 -> _Res;
                        _ -> __Res
                    end}
            end
        end, {Th, []}, lists:seq($a, $c)
    ).
