%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec max_depth(Root :: #tree_node{} | null) -> integer().

max_depth(null, Depth) -> Depth;
max_depth(Root, Depth) -> 
    lists:max([max_depth(Root#tree_node.left, Depth + 1), max_depth(Root#tree_node.right, Depth + 1)]).

max_depth(Root) ->
    max_depth(Root, 0).