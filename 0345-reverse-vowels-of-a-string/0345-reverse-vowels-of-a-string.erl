-spec reverse_vowels(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

merge([], []) -> [];
merge([V | Vs], [undefined | NVs]) ->
    [V | merge(Vs, NVs)];
merge(Vs, [NV | NVs]) ->
    [NV | merge(Vs, NVs)].

seperate(C, {V, NV}) when C =:= $a; C =:= $e; C =:= $i; C =:= $o; C =:= $u; C =:= $A; C =:= $E; C =:= $I; C =:= $O; C =:= $U -> 
    {[C | V], [undefined | NV]};
seperate(C, {V, NV}) ->
    {V, [C | NV]}.

reverse_vowels(S) ->
    {Vowels, NonVowels} = lists:foldr(fun seperate/2, {[], []}, binary_to_list(S)),
    ReverseVowels = lists:reverse(Vowels),
    list_to_binary(merge(ReverseVowels, NonVowels)).