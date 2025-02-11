%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec deepest_leaves_sum(Root :: #tree_node{} | null) -> integer().

dls(Root) -> dls(Root, 1, dict:new()).
dls(Root, _, Dict) when Root == null -> Dict;
dls(Root, Depth, Dict)->
    NewDict = dls(
        Root#tree_node.left, 
        Depth + 1,
        dls(
            Root#tree_node.right,
            Depth + 1,
            Dict
        )
    ),

    NodeVal = Root#tree_node.val,
    DepthVal = case dict:is_key(Depth, NewDict) of
        true -> dict:fetch(Depth, NewDict);
        false -> 0
    end,
    dict:store(Depth, DepthVal + NodeVal, NewDict).

max_depth(Root) -> max_depth(Root, 1).
max_depth(Root, Depth) when Root == null -> Depth - 1;
max_depth(Root, Depth) ->
    lists:max([
        max_depth(Root#tree_node.left, Depth + 1),
        max_depth(Root#tree_node.right, Depth + 1)
    ]).

deepest_leaves_sum(Root) ->
    dict:fetch(max_depth(Root), dls(Root)).