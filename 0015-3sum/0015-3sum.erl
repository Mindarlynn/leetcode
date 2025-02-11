-spec three_sum(Nums :: [integer()]) -> [[integer()]].

add([], Ans) -> Ans;
add([H | T], Ans) ->
    case sets:is_element(H, Ans) or (length(H) == 0) of
        true -> add(T, Ans);
        false -> add(T, sets:add_element(H, Ans))
    end.

main(L1, L2, I, Len, Ans) when Len =< I -> Ans;
main(L1, L2, I, Len, Ans) ->
    [II | Rest1] = L1,
    Sub = sub(Rest1, L2, II, I + 1, Len - 1, []),
    case length(Sub) of
        0 -> main(Rest1, L2, I + 1, Len, Ans);
        _ -> main(Rest1, L2, I + 1, Len, add(Sub, Ans))
    end.
    


sub(L1, L2, II, J, K, Ans) when K =< J -> Ans;
sub(L1, L2, II, J, K, Ans) ->
    [JJ | Rest1] = L1,
    [KK | Rest2] = L2,
    Sum = II + JJ + KK,
    case Sum == 0 of
        true -> sub(Rest1, Rest2, II, J + 1, K - 1, Ans ++ [[II, JJ, KK]]);
        false ->
            case Sum < 0 of
                true -> sub(Rest1, L2, II, J + 1, K, Ans);
                false -> sub(L1, Rest2, II, J, K - 1, Ans)
            end
    end.


three_sum(Nums) ->
    Sorted = lists:sort(Nums),
    sets:to_list(main(Sorted, lists:reverse(Sorted), 0, length(Sorted), sets:new())).