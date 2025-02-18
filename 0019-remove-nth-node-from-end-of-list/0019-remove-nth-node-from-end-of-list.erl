%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec remove_nth_from_end(Head :: #list_node{} | null, N :: integer()) -> #list_node{} | null.
remove_nth_from_end(Head, N) -> 
    element(1, helper(Head, N)).

helper(null, _) -> {null, 0};
helper(Node, N) ->
    {Child, Val} = helper(Node#list_node.next, N),
    if
        (Val + 1) == N -> {Child, Val + 2};
        true ->  {#list_node{val = Node#list_node.val, next = Child}, Val + 1}
    end.

