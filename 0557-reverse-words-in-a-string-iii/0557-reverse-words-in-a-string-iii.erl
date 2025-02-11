-spec reverse_words(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

impl([], Tmp) -> [Tmp];
impl([H | T], Tmp) when H =:= 32 -> [Tmp, 32] ++ impl(T, []);
impl([H | T], Tmp) ->
    impl(T, [H] ++ Tmp).

reverse_words(S) ->
    list_to_binary(impl(binary_to_list(S), [])).