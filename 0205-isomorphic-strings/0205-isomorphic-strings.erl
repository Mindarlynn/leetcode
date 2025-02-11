-spec is_isomorphic(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> boolean().

get_val(Key, Map) ->
    case maps:find(Key, Map) of
        {ok, Val} -> {Val, Map};
        _ -> {0, maps:put(Key, 0, Map)}
    end.

check_isomorphic(S, T) -> check_isomorphic(S, T, maps:new(), maps:new(), 0).
check_isomorphic([], [], _, _, _) -> true;
check_isomorphic([SH | ST], [TH | TT], SMap, TMap, Idx) ->
    {SVal, NewSMap} = get_val(SH, SMap),
    {TVal, NewTMap} = get_val(TH, TMap),

    case SVal =:= TVal of
        true -> check_isomorphic(ST, TT,
                    maps:update(SH, Idx + 1, NewSMap),
                    maps:update(TH, Idx + 1, NewTMap),
                    Idx + 1
                );
        false -> false
    end.

is_isomorphic(S, T) ->
    {SS, TT} = { binary_to_list(S), binary_to_list(T) },
    case length(SS) == length(TT) of
        true -> check_isomorphic(SS, TT);
        _ -> false
    end.
    