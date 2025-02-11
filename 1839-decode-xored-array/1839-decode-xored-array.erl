-spec decode(Encoded :: [integer()], First :: integer()) -> [integer()].


decode(Encoded, First) ->
    decode(Encoded, First, [First]).
decode([], _, Result) -> Result;
decode([H | T], Prev, Result) -> decode(T, Prev bxor H, Result ++ [Prev bxor H]).