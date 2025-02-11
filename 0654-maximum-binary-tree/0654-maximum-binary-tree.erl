%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec construct_maximum_binary_tree(Nums :: [integer()]) -> #tree_node{} | null.

construct_maximum_binary_tree_impl([]) -> null;
construct_maximum_binary_tree_impl([{Idx, Val} | T]) ->
    #tree_node{
        val = Val,
        left = construct_maximum_binary_tree_impl([{XIdx, XVal} || {XIdx, XVal} <- T, XIdx < Idx]),
        right = construct_maximum_binary_tree_impl([{XIdx, XVal} || {XIdx, XVal} <- T, XIdx > Idx])
    }.


construct_maximum_binary_tree(Nums) ->
    construct_maximum_binary_tree_impl(
        lists:sort(
            fun ({_, A}, {_, B}) ->
                A > B
            end, lists:enumerate(Nums)
        )
    ).