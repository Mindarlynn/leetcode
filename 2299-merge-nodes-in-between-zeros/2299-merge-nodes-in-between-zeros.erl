%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec merge_nodes(Head :: #list_node{} | null) -> #list_node{} | null.


%% first and last node has value 0(zero) all time.
%% can skip first node

merge_nodes_impl(null, _) -> null;
merge_nodes_impl(Node, Sum) when Node#list_node.val =:= 0 ->
    #list_node{val = Sum, next = merge_nodes_impl(Node#list_node.next, 0)};
merge_nodes_impl(Node, Sum) ->
    merge_nodes_impl(Node#list_node.next, Sum + Node#list_node.val).

merge_nodes(Head) ->
    merge_nodes_impl(Head#list_node.next, 0).