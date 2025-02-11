pass_first_if_second_length_is_odd(List1, List2) ->
    case length(List2) rem 2 of
        0 -> [];
        _ -> List1
    end.

-spec xor_all_nums(Nums1 :: [integer()], Nums2 :: [integer()]) -> integer().
xor_all_nums(Nums1, Nums2) ->
    Res = lists:map(
        fun (Nums) ->
            lists:foldl(
                fun(E, X) ->
                    X bxor E
                end, 0, Nums
            )
        end, [
            pass_first_if_second_length_is_odd(Nums1, Nums2), 
            pass_first_if_second_length_is_odd(Nums2, Nums1)
        ]
    ),
    hd(Res) bxor hd(tl(Res)).