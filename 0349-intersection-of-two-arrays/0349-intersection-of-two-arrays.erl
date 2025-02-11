-spec intersection(Nums1 :: [integer()], Nums2 :: [integer()]) -> [integer()].
intersection(Nums1, Nums2) ->
    sets:to_list(sets:intersection(sets:from_list(Nums1), sets:from_list(Nums2))).