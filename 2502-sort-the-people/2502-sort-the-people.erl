-spec sort_people(Names :: [unicode:unicode_binary()], Heights :: [integer()]) -> [unicode:unicode_binary()].
sort_people(Names, Heights) ->
    lists:map(
        fun ({_, Name}) ->
            Name
        end, lists:reverse(lists:sort(lists:zip(Heights, Names)))
    ).