-spec is_subsequence(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> boolean().

real_is_subsequence([], _, Len) -> Len;
real_is_subsequence(_, [], _) -> -1;
real_is_subsequence([], [], Len) -> Len;
real_is_subsequence([CS | CSs], [CT | CTs], Len) when CS == CT ->
    real_is_subsequence(CSs, CTs, Len + 1);
real_is_subsequence([CS | CSs], [CT | CTs], Len) ->
    real_is_subsequence([CS | CSs], CTs, Len).

is_subsequence(S, T) ->
    SS = binary_to_list(S),
    TT = binary_to_list(T),
    length(SS) == real_is_subsequence(SS, TT, 0).