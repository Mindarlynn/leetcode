%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec average_of_subtree(Root :: #tree_node{} | null) -> integer().

average_of_subtree_impl(Node) -> average_of_subtree_impl(Node, 0, 0, 0).
%% returns {count of child subtree, sum of child tree, count of nodes meet condition}
average_of_subtree_impl(null, Cnt, Sum, Res) -> {Cnt, Sum, Res};
average_of_subtree_impl(Node, Cnt, Sum, Res) ->
    {LCnt, LSum, LRes} = average_of_subtree_impl(Node#tree_node.left),
    {RCnt, RSum, RRes} = average_of_subtree_impl(Node#tree_node.right),
    {CurCnt, CurSum} = {LCnt + RCnt + 1, LSum + RSum + Node#tree_node.val},
    CurRes = LRes + RRes + 
        case trunc(CurSum div CurCnt) =:= Node#tree_node.val of
            true -> 1;
            false -> 0
        end,
    {CurCnt, CurSum, CurRes}.

average_of_subtree(Root) ->
    {_, _, Res} = average_of_subtree_impl(Root),
    Res.