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
construct(PreOrder, PostOrder) ->
    %io:format("~w~n~w~n", [[H1 | T1], [H2 | T2]]),
    {LResPre, LResPos, Left} = if
        hd(PreOrder) =/= hd(PostOrder) -> construct(tl(PreOrder), PostOrder);
        true -> {tl(PreOrder), PostOrder, null}
    end,
    {RResPre, RResPos, Right} = if
        hd(PreOrder) =/= hd(LResPos) -> construct(LResPre, LResPos);
        true -> {LResPre, LResPos, null}
    end,
    {RResPre, case RResPos of [] -> []; _ -> tl(RResPos) end , #tree_node{val = hd(PreOrder), left = Left, right = Right}}.
        
    