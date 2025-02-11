-spec score_of_string(S :: unicode:unicode_binary()) -> integer().

impl_score_of_string(_, []) -> 0;
impl_score_of_string(Prev, [H | T]) ->
    abs(Prev - H) + impl_score_of_string(H, T).

score_of_string(S) ->
    SS = binary_to_list(S),
    impl_score_of_string(hd(SS), tl(SS)).