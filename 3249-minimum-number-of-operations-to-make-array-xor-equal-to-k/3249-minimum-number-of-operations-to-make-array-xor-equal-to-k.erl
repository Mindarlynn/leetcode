-spec min_operations(Nums :: [integer()], K :: integer()) -> integer().

xor_arr([], Prev) -> Prev;
xor_arr([H | T], Prev) -> xor_arr(T, Prev bxor H).

min_operations(Nums, K) ->
    length([X || X <- integer_to_list(xor_arr(Nums, K), 2), X =:= $1]).

%    1 bxor 2 bxor 1 bxor 3 bxor 4.