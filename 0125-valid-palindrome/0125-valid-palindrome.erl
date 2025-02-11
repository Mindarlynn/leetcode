-spec is_palindrome(S :: unicode:unicode_binary()) -> boolean().

is_palindrome(S) ->
    Str = [X || <<X>> <= S, (X >= $A andalso X =< $Z) orelse (X >= $0 andalso X =< $9) orelse (X >= $a andalso X =< $z)],
    Lower = string:lowercase(Str),
    Lower =:= lists:reverse(Lower).