%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec get_minimum_difference(Root :: #tree_node{} | null) -> integer().
get_minimum_difference(Root) ->
    Flat = flatten(Root),

    lists:min(
        lists:map(
            fun(X) ->
                lists:min(
                    lists:map(
                        fun(Y) ->
                            case abs(X - Y) of
                                0 -> 987654321;
                                Val -> Val
                            end
                        end, Flat
                    )
                )
            end, Flat
        )
    ).


flatten(null) -> [];
flatten(Node) -> 
    [Node#tree_node.val] ++ 
    flatten(Node#tree_node.left) ++ 
    flatten(Node#tree_node.right).