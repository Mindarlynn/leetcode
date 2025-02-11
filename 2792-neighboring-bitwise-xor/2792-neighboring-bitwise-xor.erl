-spec does_valid_array_exist(Derived :: [integer()]) -> boolean().
does_valid_array_exist(Derived) ->
    lists:foldl(
        fun (X, Xor) ->
            Xor bxor X
        end, 0, Derived
    ) =:= 0.