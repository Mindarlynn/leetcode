-spec num_identical_pairs(Nums :: [integer()]) -> integer().
num_identical_pairs([]) -> 0;
num_identical_pairs([H | T]) -> 
    length([X || X <- T, X =:= H]) + num_identical_pairs(T).