-spec kids_with_candies(Candies :: [integer()], ExtraCandies :: integer()) -> [boolean()].
kids_with_candies(Candies, ExtraCandies) ->
    Max = lists:max(Candies),
    lists:map(
        fun (X) ->
            X + ExtraCandies >= Max
        end,
        Candies
    ).