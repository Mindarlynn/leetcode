%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec level_order(Root :: #tree_node{} | null) -> [[integer()]].

level_order(null, _) -> [];
level_order(Node, Level) ->
    [{Level, Node#tree_node.val}] ++ 
    level_order(Node#tree_node.left, Level + 1) ++
    level_order(Node#tree_node.right, Level + 1).

level_order(Root) ->
    [L || {_, L} <- lists:keysort(1, maps:to_list(lists:foldl(
        fun({Lv, Val}, Map) ->
            case maps:is_key(Lv, Map) of
                true -> maps:update(Lv, maps:get(Lv, Map) ++ [Val], Map);
                false -> maps:put(Lv, [Val], Map)
            end
        end, maps:new(), level_order(Root, 0)
    )))].