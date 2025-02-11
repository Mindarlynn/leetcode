-spec number_of_pairs(Nums1 :: [integer()], Nums2 :: [integer()], K :: integer()) -> integer().

number_of_pairs_impl([], _, _, Result) -> Result;
number_of_pairs_impl([H | T], Nums2, K, Result) -> 
    number_of_pairs_impl(T, Nums2, K, Result + length([X || X <- Nums2, H rem (X * K) =:= 0])).


number_of_pairs(Nums1, Nums2, K) ->
    number_of_pairs_impl(Nums1, Nums2, K, 0).