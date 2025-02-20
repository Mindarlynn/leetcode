-spec find_different_binary_string(Nums :: [unicode:unicode_binary()]) -> unicode:unicode_binary().
find_different_binary_string(Nums) ->
    Set = sets:from_list(lists:map(fun binary_to_list/1, Nums)),
    N = length(Nums),
    list_to_binary(bcktrk([$0, $1], N, Set, 0, [])).

bcktrk(_, N, Set, N, Tmp) ->
    case sets:is_element(Tmp, Set) of
        true -> [];
        false -> Tmp
    end;
bcktrk(List, N, Set, Len, Tmp) ->
    lists:foldl(
        fun(X, Res) ->
            _Res = bcktrk(N, Set, Len + 1, Tmp ++ [X]),
            case _Res of
                [] -> Res;
                _ -> _Res
            end
        end, [], List
    ).