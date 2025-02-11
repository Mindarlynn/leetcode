%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec kth_smallest(Root :: #tree_node{} | null, K :: integer()) -> integer().

flatten(null) -> [];
flatten(Node) -> 
    flatten(Node#tree_node.left) ++ [Node#tree_node.val] ++ flatten(Node#tree_node.right).

kth_smallest(Root, K) ->
    lists:nth(K, flatten(Root)).