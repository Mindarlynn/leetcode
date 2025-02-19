-spec get_happy_string(N :: integer(), K :: integer()) -> unicode:unicode_binary().
get_happy_string(N, K) ->
    list_to_binary(element(2, bcktrack([$a, $b, $c], N, K, 0, 1, -1, []))).

bcktrack(_, N, K, N, K, _, Res) -> {K + 1, Res};
bcktrack(_, N, K, N, Th, _, Res) -> 
    {Th + if Th < K -> 1; true -> 0 end, []};
bcktrack(List, N, K, Len, Th, Prev, Res) ->
    lists:foldl(
        fun(Ch, {_Th, _Res}) ->
            if
                (Ch == Prev) or (_Th > K) -> {_Th, _Res};
                true -> 
                    % {__Th, __Res} = bcktrack(List, N, K, Len + 1, _Th, Ch, Res ++ [Ch]),
                    % {__Th, case __Res of
                    %     [] -> _Res;
                    %     _ -> __Res
                    % end}
                    bcktrack(List, N, K, Len + 1, _Th, Ch, Res ++ [Ch])
            end
        end, {Th, []}, List
    ).