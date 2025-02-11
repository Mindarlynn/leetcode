-spec decode_message(Key :: unicode:unicode_binary(), Message :: unicode:unicode_binary()) -> unicode:unicode_binary().

remove_space(L) -> [X || X <- L, X =/= 32]. 
remove_dups([]) -> [];
remove_dups([H|T]) -> [H | [X || X <- remove_dups(T), X /= H]].

decode_message(Key, Message) ->
    KeyMap = maps:put(32, 32, maps:from_list([{Val, Idx - 1 + $a} || {Idx, Val} <- lists:enumerate(remove_dups(remove_space(binary_to_list(Key))))])),
    list_to_binary(lists:map(
        fun (Ch) ->
            maps:get(Ch, KeyMap)
        end,
        binary_to_list(Message)
    )).
    