-spec longest_valid_parentheses(S :: unicode:unicode_binary()) -> integer().

% stack definition
push(Elem, Stack) -> [Elem] ++ Stack.
top([H | _]) -> H.
pop([_ | T]) -> T.
is_empty([]) -> true;
is_empty(_) -> false.

longest_valid_parentheses([], Stack, Ans) ->  Ans;
longest_valid_parentheses([H | T], Stack, Ans) -> 
    {Xi, X} = H,
    case X == $( of
        true -> longest_valid_parentheses(T, push(Xi, Stack), Ans);
        false ->
            NewStack = pop(Stack),
            {NewStack2, NewAns} = case is_empty(NewStack) of
                true -> {push(Xi, NewStack), Ans};
                false -> {NewStack, lists:max([Ans, Xi - top(NewStack)])}
            end,
            longest_valid_parentheses(T, NewStack2, NewAns)
    end.

longest_valid_parentheses(S) ->
    T = binary_to_list(S),
    L = lists:zip(lists:seq(0, length(T) - 1), T),
    longest_valid_parentheses(L, [-1], 0).