%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec min_depth(Root :: #tree_node{} | null) -> integer().


min_depth(null, _) -> 100000;
min_depth(Root, Count) when Root#tree_node.left == null, Root#tree_node.right == null -> Count;
min_depth(Root, Count) ->
    min(
        min_depth(Root#tree_node.left, Count + 1),
        min_depth(Root#tree_node.right, Count + 1)
    ).

min_depth(null) -> 0;
min_depth(Root) ->
    min_depth(Root, 1).