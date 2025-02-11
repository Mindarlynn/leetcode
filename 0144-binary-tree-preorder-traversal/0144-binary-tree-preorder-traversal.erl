%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec preorder_traversal(Root :: #tree_node{} | null) -> [integer()].

preorder_traversal(null) -> [];
preorder_traversal(Root) -> 
    Val = Root#tree_node.val,
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    [Val] ++ preorder_traversal(Left) ++ preorder_traversal(Right).