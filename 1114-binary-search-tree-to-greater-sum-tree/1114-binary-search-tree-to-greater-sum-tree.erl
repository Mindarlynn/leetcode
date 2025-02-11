%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec bst_to_gst(Root :: #tree_node{} | null) -> #tree_node{} | null.

bst_to_gst_impl(null, Sum) -> {Sum, null};
bst_to_gst_impl(Node, Sum) ->
    {RightSum, Right} = bst_to_gst_impl(Node#tree_node.right, Sum),
    CurVal = Node#tree_node.val + RightSum,
    {LeftSum, Left} = bst_to_gst_impl(Node#tree_node.left, CurVal),
    {LeftSum, #tree_node{val = CurVal, left = Left, right = Right}}.

bst_to_gst(Root) ->
    {_, Result} = bst_to_gst_impl(Root, 0),
    Result.