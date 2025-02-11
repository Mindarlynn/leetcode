%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec postorder_traversal(Root :: #tree_node{} | null) -> [integer()].

postorder_traversal(null) -> [];
postorder_traversal(Root) ->
    Val = Root#tree_node.val,
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    postorder_traversal(Left) ++ postorder_traversal(Right) ++ [Val].