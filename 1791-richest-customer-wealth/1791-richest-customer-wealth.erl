-spec maximum_wealth(Accounts :: [[integer()]]) -> integer().

maximum_wealth(Accounts) ->
    lists:max(lists:map(fun lists:sum/1, Accounts)).