-spec intersect(Nums1 :: [integer()], Nums2 :: [integer()]) -> [integer()].
intersect(Nums1, Nums2) ->
    lists:subtract(
        Nums1,
        lists:subtract(Nums1, Nums2)
    ).