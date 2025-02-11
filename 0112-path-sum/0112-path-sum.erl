%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec has_path_sum(Root :: #tree_node{} | null, TargetSum :: integer()) -> boolean().

has_path_sum(null, Target, Cur) -> false;
has_path_sum(Root, Target, Cur) -> 
    Val = Root#tree_node.val,
    Sum = Val + Cur,
    Left = Root#tree_node.left,
    Right = Root#tree_node.right,

    case {Left, Right} of
        {null, null} -> Target == Sum;
        _ -> 
            case {has_path_sum(Left, Target, Sum), has_path_sum(Right, Target, Sum)} of
                {false, false} -> false;
                _ -> true
            end
    end.
    
has_path_sum(Root, TargetSum) ->
    case Root of
        null -> false;
        _ -> 
            has_path_sum(Root, TargetSum, 0)
    end.
    