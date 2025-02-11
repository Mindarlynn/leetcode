%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_symmetric(Root :: #tree_node{} | null) -> boolean().
-spec inorder(Root :: #tree_node{} | null) -> [integer()].

inorder(null) -> [];
inorder(Root) -> 
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    [[inorder(Left)|[Root#tree_node.val]]|inorder(Right)].

outorder(null) -> [];
outorder(Root) ->
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    [[outorder(Right)|[Root#tree_node.val]]|outorder(Left)].

is_symmetric(Root) ->
    inorder(Root#tree_node.left) =:= outorder(Root#tree_node.right).