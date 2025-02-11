%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_balanced(Root :: #tree_node{} | null) -> boolean().

height(null, Depth) -> Depth;
height(Root, Depth) ->
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    lists:max([height(Left, Depth + 1), height(Right, Depth + 1)]).

is_balanced(null) -> true;
is_balanced(Root) ->
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,
    case abs(height(Left, 0) - height(Right, 0)) =< 1 of
        false -> false;
        true -> 
            case {is_balanced(Left), is_balanced(Right)} of
                {true, true} -> true;
                _ -> false
            end
    end.