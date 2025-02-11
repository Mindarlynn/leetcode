%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec evaluate_tree(Root :: #tree_node{} | null) -> boolean().
%% OR
evaluate_treee(Root) when Root#tree_node.val =:= 2 ->
    evaluate_treee(Root#tree_node.left) bor evaluate_treee(Root#tree_node.right);
%% AND
evaluate_treee(Root) when Root#tree_node.val =:= 3 ->
    evaluate_treee(Root#tree_node.left) band evaluate_treee(Root#tree_node.right);
%% Normal Value
evaluate_treee(Root) ->
    Root#tree_node.val.

evaluate_tree(Root) ->
    case evaluate_treee(Root) of
        0 -> false;
        1 -> true
    end.