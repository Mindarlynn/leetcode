-spec four_sum(Nums :: [integer()], Target :: integer()) -> [[integer()]].

add([], Ans) -> Ans;
add([H | T], Ans) ->
    case lists:member(H, Ans) or (length(H) == 0) of
        true -> add(T, Ans);
        false -> add(T, Ans ++ [H])
    end.

main(L1, L2, Target, I, Len, Ans) when Len =< I -> Ans;
main(L1, L2, Target, I, Len, Ans) ->
    [II | Rest1] = L1,
    Sub = sub1(Rest1, L2, Target, II, I + 1, Len, []),
    case length(Sub) of
        0 -> main(Rest1, L2, Target, I + 1, Len, Ans);
        _ -> main(Rest1, L2, Target, I + 1, Len, add(Sub, Ans))
    end.
    
sub1(L1, L2, Target, II, J, Len, Ans) when Len =< J -> Ans;
sub1(L1, L2, Target, II, J, Len, Ans) ->
    [JJ | Rest] = L1,
    Sub = sub2(Rest, L2, Target, II, JJ, J + 1, Len - 1, []),
    case length(Sub) of
        0 -> sub1(Rest, L2, Target, II, J + 1, Len, Ans);
        _ -> sub1(Rest, L2, Target, II, J + 1, Len, add(Sub, Ans))
    end.

sub2(L1, L2, Target, II, JJ, K, Z, Ans) when Z =< K -> Ans;
sub2(L1, L2, Target, II, JJ, K, Z, Ans) ->
    [KK | Rest1] = L1,
    [ZZ | Rest2] = L2,
    Sum = II + JJ + KK + ZZ,
    case Sum == Target of
        true -> sub2(Rest1, Rest2, Target, II, JJ, K + 1, Z - 1, Ans ++ [[II, JJ, KK, ZZ]]);
        false ->
            case Sum < Target of
                true -> sub2(Rest1, L2, Target, II, JJ, K + 1, Z, Ans);
                false -> sub2(L1, Rest2, Target, II, JJ, K, Z - 1, Ans)
            end
    end.

four_sum(Nums, Target) ->
    Sorted = lists:sort(Nums),
    main(Sorted, lists:reverse(Sorted), Target, 0, length(Sorted), []).
