acc([H | T]) -> acc(T, H, H).

acc([], _, Sum) -> Sum;
acc([H | T], Prev, Sum) when Prev < H -> acc(T, H, Sum + H);
acc([H | T], Prev, Sum) ->
    max(
        Sum,
        acc(T, H, H)
    ).

-spec max_ascending_sum(Nums :: [integer()]) -> integer().
max_ascending_sum(Nums) ->
    acc(Nums).