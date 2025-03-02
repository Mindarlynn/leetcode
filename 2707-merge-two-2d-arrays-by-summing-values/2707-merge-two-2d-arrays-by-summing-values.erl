-spec merge_arrays(Nums1 :: [[integer()]], Nums2 :: [[integer()]]) -> [[integer()]].
merge_arrays([], []) -> [];
merge_arrays(Nums1, []) -> Nums1;
merge_arrays([], Nums2) -> Nums2;
merge_arrays([[Id1, Val1] | T1], [[Id2, Val2] | T2]) ->
    if
        Id1 == Id2 -> [[Id1, Val1 + Val2]] ++ merge_arrays(T1, T2);
        Id1 < Id2 -> [[Id1, Val1]] ++ merge_arrays(T1, [[Id2, Val2] | T2]);
        true -> [[Id2, Val2]] ++ merge_arrays([[Id1, Val1] | T1], T2)
    end.
    
