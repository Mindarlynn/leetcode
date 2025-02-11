-spec find_median_sorted_arrays(Nums1 :: [integer()], Nums2 :: [integer()]) -> float().

find_median_sorted_arrays(Nums1, Nums2) ->
    Merged = lists:merge(Nums1, Nums2),
    Len = length(Merged),
    Med1 = lists:nth(Len div 2 + 1, Merged),

    case Len rem 2 of
        1 -> Med1;
        _ ->
            Med2 = lists:nth(Len div 2 , Merged),
            (Med1 + Med2) / 2
    end.
