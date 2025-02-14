%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec recover_from_preorder(Traversal :: unicode:unicode_binary()) -> #tree_node{} | null.
recover_from_preorder(<<Traversal/binary>>) ->
    recover_from_preorder(binary_to_list(Traversal));

recover_from_preorder(Traversal) ->
    element(1, helper(Traversal)).

helper(Traversal) -> helper(Traversal, [], 0, 0).

helper([], [], _, _) -> {null, []};
helper([], Tmp, Dashes, Depth) when Dashes =:= Depth -> {#tree_node{val = list_to_integer(Tmp), left = null, right = null}, []};
helper([], _, _, _) -> {null, []};
%when dash (-)
helper([$- | T], Tmp, Dashes, Depth) -> 
    case length(Tmp) of
        0 -> helper(T, Tmp, Dashes + 1, Depth);
        _ when Dashes =/= Depth -> {null, []};
        _ ->  
            {LeftNode, LeftStr} = 
                case helper(T, [], 1, Depth + 1) of
                    {null, _} -> {null, T};
                    LRes -> LRes
                end,
            {RightNode, RightStr} = 
                case helper(LeftStr, [], 1, Depth + 1) of
                    {null, _} -> {null, LeftStr};
                    RRes -> RRes
                end,
            %io:format("Val: ~p~nT: ~p~nL: ~p~nR: ~p~n~n", [Tmp, T, LeftStr, RightStr]),
            {#tree_node{val = list_to_integer(Tmp), left = LeftNode, right = RightNode}, RightStr}
    end;
%when number
helper([H | T], Tmp, Dashes, Depth) when H >= $0 andalso H =< $9 ->
    helper(T, Tmp ++ [H], Dashes, Depth).
