%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec construct_from_pre_post(Preorder :: [integer()], Postorder :: [integer()]) -> #tree_node{} | null.
construct_from_pre_post(PreOrder, PostOrder) ->
    element(3, construct(PreOrder, PostOrder)).

construct(_, []) -> {[], [], null};
construct([], _) -> {[], [], null};
construct([H1 | T1], [H2 | T2]) ->
    %io:format("~w~n~w~n", [[H1 | T1], [H2 | T2]]),
    {LResPre, LResPos, Left} = if
        H1 =/= H2 -> construct(T1, [H2 | T2]);
        true -> {T1, [H2 | T2], null}
    end,
    {RResPre, RResPos, Right} = if
        H1 =/= hd(LResPos) -> construct(LResPre, LResPos);
        true -> {LResPre, LResPos, null}
    end,
    {RResPre, case RResPos of [] -> []; _ -> tl(RResPos) end , #tree_node{val = H1, left = Left, right = Right}}.
        
    