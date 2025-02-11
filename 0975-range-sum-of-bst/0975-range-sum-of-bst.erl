%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec range_sum_bst(Root :: #tree_node{} | null, Low :: integer(), High :: integer()) -> integer().

range_sum_bst_impl(null, _, _) -> 0;
range_sum_bst_impl(Root, Low, High) ->
    range_sum_bst_impl(Root#tree_node.left, Low, High) + 
    range_sum_bst_impl(Root#tree_node.right, Low, High) + 
    if
    Root#tree_node.val =< High, Root#tree_node.val >= Low ->
        Root#tree_node.val;
    true ->
        0
    end.

range_sum_bst(Root, Low, High) ->
    range_sum_bst_impl(Root, Low, High).