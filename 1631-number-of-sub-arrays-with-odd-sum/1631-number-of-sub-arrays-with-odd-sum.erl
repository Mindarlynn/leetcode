-spec num_of_subarrays(Arr :: [integer()]) -> integer().
num_of_subarrays(Arr) ->
    element(4, lists:foldl(
        fun(X, {Sum, Odd, Even, Res}) ->
            NewSum = Sum + X,
            {NewOdd, NewEven, NewRes} = 
                if
                    NewSum rem 2 == 0 ->
                        {Odd, Even + 1, (Res + Odd) rem 1000000007};
                    true -> 
                        {Odd + 1, Even, (Res + Even) rem 1000000007}
                end,
            {NewSum, NewOdd, NewEven, NewRes}
        end, {0, 0, 1, 0}, Arr
    )).