%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_subtree(Root :: #tree_node{} | null, SubRoot :: #tree_node{} | null) -> boolean().
is_subtree(null, _) -> false;
is_subtree(_, null) -> false;
is_subtree(Root, Root) -> true;
is_subtree(Root, SubRoot) ->
    is_subtree(Root#tree_node.left, SubRoot) or is_subtree(Root#tree_node.right, SubRoot).