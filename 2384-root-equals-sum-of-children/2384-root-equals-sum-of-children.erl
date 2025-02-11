%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec check_tree(Root :: #tree_node{} | null) -> boolean().

sum(null) -> 0;
sum(Node) ->
    Node#tree_node.val +
    sum(Node#tree_node.left) +
    sum(Node#tree_node.right).

check_tree(Root) ->
    Root#tree_node.val =:= sum(Root#tree_node.left) + sum(Root#tree_node.right).