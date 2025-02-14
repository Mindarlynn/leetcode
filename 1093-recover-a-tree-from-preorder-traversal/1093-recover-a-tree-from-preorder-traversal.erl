%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec recover_from_preorder(Traversal :: unicode:unicode_binary()) -> #tree_node{} | null.
recover_from_preorder(Traversal) ->
    element(1, helper(binary_to_list(Traversal))).

make_child(Str, Depth) ->
    case helper(Str, [], 1, Depth + 1) of
        {null, _} -> {null, Str};
        Res -> Res
    end.

helper(Traversal) -> helper(Traversal, [], 0, 0).

helper([], [], _, _) -> 
    {null, []};
helper([], Tmp, D, D) -> 
    {#tree_node{val = list_to_integer(Tmp), left = null, right = null}, []};
helper([], _, _, _) -> 
    {null, []};
%when dash (-)
helper([$- | T], Tmp, Dashes, Depth) -> 
    case length(Tmp) of
        0 -> helper(T, Tmp, Dashes + 1, Depth);
        _ when Dashes =/= Depth -> {null, []};
        _ ->  
            {LeftNode, LeftStr} = make_child(T, Depth),
            {RightNode, RightStr} = make_child(LeftStr, Depth),
            {#tree_node{val = list_to_integer(Tmp), left = LeftNode, right = RightNode}, RightStr}
    end;
%when number
helper([H | T], Tmp, Dashes, Depth) ->
    helper(T, Tmp ++ [H], Dashes, Depth).
