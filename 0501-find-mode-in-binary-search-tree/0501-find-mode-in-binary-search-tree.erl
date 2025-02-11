%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec find_mode(Root :: #tree_node{} | null) -> [integer()].

count(R, D) when R == null -> D;
count(R, D) ->
    D1 = count(
        R#tree_node.right,
        count(R#tree_node.left, D)
    ),

    V = R#tree_node.val,
    C = case dict:is_key(V, D1) of
        true -> dict:fetch(V, D1) + 1;
        false -> 1
    end,
    dict:store(V, C, D1).

change(N, V, {M, L}) when V == M -> {M, L ++ [N]};
change(N, V, {M, L}) when V < M -> {M, L};
change(N, V, {M, L}) when V > M -> {V, [N]}.

find(R, D, {M, L}) when R == null -> {M, L};
find(R, D, {M, L}) ->
    V = R#tree_node.val,
    change(
        V, dict:fetch(V, D), 
        find(R#tree_node.right, D, 
            find(R#tree_node.left, D, {M, L})
        )
    ).

distinct(L) -> sets:to_list(sets:from_list(L)).

find_mode(Root) when Root == null -> [];
find_mode(Root) ->
  {_, L} = find(Root, count(Root, dict:new()), {0, []}),
  distinct(L).
  