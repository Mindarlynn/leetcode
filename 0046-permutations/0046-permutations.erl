-spec permute(Nums :: [integer()]) -> [[integer()]].

permute([]) -> [[]];
permute(Nums) -> [ [H | T] || H <- Nums, T <- permute(lists:delete(H, Nums))].