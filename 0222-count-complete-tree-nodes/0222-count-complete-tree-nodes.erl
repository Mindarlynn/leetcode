%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec count_nodes(Root :: #tree_node{} | null) -> integer().
count_nodes(null) -> 0;
count_nodes(Root) ->
  1 + count_nodes(Root#tree_node.left) + count_nodes(Root#tree_node.right).