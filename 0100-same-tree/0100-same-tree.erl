%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_same_tree(P :: #tree_node{} | null, Q :: #tree_node{} | null) -> boolean().

unf(null) -> [99999];
unf(R) ->
    [R#tree_node.val] ++ unf(R#tree_node.left) ++ unf(R#tree_node.right).

is_same_tree(P, Q) ->
  unf(P) =:= unf(Q).