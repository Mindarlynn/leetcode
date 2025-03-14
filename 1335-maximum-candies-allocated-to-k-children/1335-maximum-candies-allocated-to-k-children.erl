-spec maximum_candies(Candies :: [integer()], K :: integer()) -> integer().
maximum_candies(Candies, K) ->
    impl(Candies, K, 0, 100000001).

impl(_      , _, Left, Right) when Left >= Right -> Left;
impl(Candies, K, Left, Right) ->
    Mid = (Left + Right + 1) div 2,
    Sum = lists:foldl(
        fun(X, Res) ->
            Res + X div Mid
        end, 0, Candies
    ),

    {NewLeft, NewRight} = if
        K > Sum -> {Left, Mid - 1};
        true -> {Mid, Right}
    end,
    
    impl(Candies, K, NewLeft, NewRight).