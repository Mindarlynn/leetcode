-spec remove_outer_parentheses(S :: unicode:unicode_binary()) -> unicode:unicode_binary().

% exit condition
remove_outer_parentheses_impl([], _) -> [];
% outermost parenthese starts
remove_outer_parentheses_impl([H | T], Depth) when H =:= $(, Depth =:= 0 ->
    remove_outer_parentheses_impl(T, Depth + 1);
% inner parenthese starts
remove_outer_parentheses_impl([H | T], Depth) when H =:= $( ->
    [H] ++ remove_outer_parentheses_impl(T, Depth + 1);
% outermost parenthese ends
remove_outer_parentheses_impl([H | T], Depth) when Depth =:= 1 ->
    remove_outer_parentheses_impl(T, Depth - 1);
% inner parenthese ends
remove_outer_parentheses_impl([H | T], Depth)  ->
    [H] ++ remove_outer_parentheses_impl(T, Depth - 1).
    

remove_outer_parentheses(S) ->
    list_to_binary(remove_outer_parentheses_impl(binary_to_list(S), 0)).