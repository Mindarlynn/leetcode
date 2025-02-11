-spec check_if_pangram(Sentence :: unicode:unicode_binary()) -> boolean().
check_if_pangram(Sentence) ->
    length(lists:usort(binary_to_list(Sentence))) =:= 26.