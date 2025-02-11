get_longest([H | T]) -> get_longest(T, H, 1).

get_longest([], _, Len) -> Len;
get_longest([H | T], Prev, Len) when Prev < H -> get_longest(T, H, Len + 1);
get_longest([H | T], Prev, Len) ->
    max(
        Len,
        get_longest(T, H, 1)
    ).

-spec longest_monotonic_subarray(Nums :: [integer()]) -> integer().
longest_monotonic_subarray(Nums) ->
    max(
        get_longest(Nums),
        get_longest(lists:reverse(Nums))
    ).