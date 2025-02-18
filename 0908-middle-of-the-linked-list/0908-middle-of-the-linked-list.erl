%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

helper(Slow, null) -> Slow;
helper(Slow, Fast) when Fast#list_node.next =/= null ->
    helper(Slow#list_node.next, Fast#list_node.next#list_node.next);
helper(Slow, Fast) when Fast#list_node.next == null -> Slow.

-spec middle_node(Head :: #list_node{} | null) -> #list_node{} | null.
middle_node(Head) ->
    helper(Head, Head).