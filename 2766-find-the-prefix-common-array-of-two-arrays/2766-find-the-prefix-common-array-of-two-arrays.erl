check(E, {Half, Common})          -> check(E, Half, Common, sets:is_element(E, Half)).
check(E, Half, Common, true)    -> {sets:del_element(E, Half), Common + 1};
check(E, Half, Common, false)   -> {sets:add_element(E, Half), Common}.

impl([], [], _, _) -> [];
impl([H1 | T1], [H2 | T2], Half, Common) ->
    {NewHalf, NewCommon} = check(H2, check(H1, {Half, Common})),
    [NewCommon] ++ impl(T1, T2, NewHalf, NewCommon).

-spec find_the_prefix_common_array(A :: [integer()], B :: [integer()]) -> [integer()].
find_the_prefix_common_array(A, B) ->
    impl(A, B, sets:new(), 0).