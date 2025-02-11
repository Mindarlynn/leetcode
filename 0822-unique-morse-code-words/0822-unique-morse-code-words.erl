-spec unique_morse_representations(Words :: [unicode:unicode_binary()]) -> integer().
unique_morse_representations(Words) ->
    MorseMap = #{ X => Y || {X, Y} <- lists:zip(lists:seq(0, 25), [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]) },
    length(lists:usort(lists:map(
        fun (X) ->
            lists:foldl(
                fun (Y, Arr) ->
                    Arr ++ maps:get(Y, MorseMap)
                end, [], [Z - $a || Z <- binary_to_list(X)]
            )
        end, Words
    ))).