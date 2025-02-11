%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec sum_of_left_leaves(Root :: #tree_node{} | null) -> integer().

sum(_, null) -> 0;
sum(Type, Root) when Type == left, Root#tree_node.left == null, Root#tree_node.right == null->
    Root#tree_node.val;
sum(Type, Root) ->
    sum(left, Root#tree_node.left) +
    sum(right, Root#tree_node.right).

sum_of_left_leaves(Root) ->
    sum(left, Root#tree_node.left) +
    sum(right, Root#tree_node.right).